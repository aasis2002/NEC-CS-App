import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'app_database.dart';
import '../utils/repetition_controller.dart';
import '../utils/readiness_calculator.dart';
import '../services/question_generator_service.dart';
import '../../features/practice/domain/question_models.dart';

class NecRepository {
  final AppDatabase db;
  final RepetitionController _repetitionController;
  final _uuid = const Uuid();

  NecRepository(this.db, [RepetitionController? repetitionController])
      : _repetitionController = repetitionController ?? RepetitionController();

  /// Initializes default guest user and seeds syllabus, notes, and question bank if empty
  Future<void> initAndSeed({String? mockSyllabusJson, String? mockManifestJson, String? mockQuestionsJson}) async {
    // 1. Ensure a default local guest user exists
    final existingUsers = await db.select(db.users).get();
    if (existingUsers.isEmpty) {
      final now = DateTime.now();
      await db.into(db.users).insert(UsersCompanion(
        id: const Value('local_guest_user'),
        email: const Value('guest@necprep.local'),
        displayName: const Value('NEC Aspirant'),
        isGuest: const Value(true),
        createdAt: Value(now),
        lastLoginAt: Value(now),
        updatedAt: Value(now),
      ));
    }

    // 2. Check if syllabus is seeded
    final subjects = await db.select(db.subjects).get();
    if (subjects.isEmpty) {
      await _seedSyllabus(mockSyllabusJson);
      await _seedNotes(mockManifestJson);
      await _seedQuestions(mockQuestionsJson);
    }
  }

  Future<void> _seedSyllabus(String? mockJson) async {
    String jsonString;
    if (mockJson != null) {
      jsonString = mockJson;
    } else {
      try {
        jsonString = await rootBundle.loadString('assets/data/syllabus.json');
      } catch (_) {
        return;
      }
    }

    final data = jsonDecode(jsonString) as Map<String, dynamic>;
    final subjectData = data['subject'] as Map<String, dynamic>;

    await db.into(db.subjects).insert(SubjectsCompanion(
      id: Value(subjectData['id'] as String),
      code: Value(subjectData['code'] as String),
      name: Value(subjectData['name'] as String),
      description: Value(subjectData['description'] as String),
      orderIndex: const Value(1),
    ));

    final units = data['units'] as List<dynamic>;
    for (final u in units) {
      final uMap = u as Map<String, dynamic>;
      final unitId = uMap['id'] as String;
      await db.into(db.units).insert(UnitsCompanion(
        id: Value(unitId),
        subjectId: Value(subjectData['id'] as String),
        unitNumber: Value(uMap['unitNumber'] as int),
        code: Value(uMap['code'] as String),
        title: Value(uMap['title'] as String),
        description: Value(uMap['description'] as String),
        weightageQuestions: Value(uMap['weightageQuestions'] as int? ?? 5),
      ));

      final topics = uMap['topics'] as List<dynamic>;
      for (final t in topics) {
        final tMap = t as Map<String, dynamic>;
        await db.into(db.topics).insert(TopicsCompanion(
          id: Value(tMap['id'] as String),
          unitId: Value(unitId),
          topicNumber: Value(tMap['topicNumber'] as String),
          code: Value(tMap['code'] as String),
          title: Value(tMap['title'] as String),
        ));
      }
    }
  }

  Future<void> _seedNotes(String? mockJson) async {
    String jsonString;
    if (mockJson != null) {
      jsonString = mockJson;
    } else {
      try {
        jsonString = await rootBundle.loadString('assets/notes/manifest.json');
      } catch (_) {
        return;
      }
    }

    final data = jsonDecode(jsonString) as Map<String, dynamic>;
    final notes = data['notes'] as List<dynamic>;
    final now = DateTime.now();

    for (final n in notes) {
      final nMap = n as Map<String, dynamic>;
      await db.into(db.notes).insert(NotesCompanion(
        id: Value(nMap['id'] as String),
        unitId: Value(nMap['unitId'] as String),
        topicId: Value(nMap['topicId'] as String),
        title: Value(nMap['title'] as String),
        filePath: Value(nMap['filePath'] as String),
        estimatedReadMinutes: Value(nMap['estimatedReadMinutes'] as int? ?? 5),
        isCompleted: const Value(false),
        isBookmarked: const Value(false),
        updatedAt: Value(now),
      ));
    }
  }

  Future<void> _seedQuestions(String? mockJson) async {
    String jsonString;
    if (mockJson != null) {
      jsonString = mockJson;
    } else {
      try {
        jsonString = await rootBundle.loadString('assets/data/questions_seed.json');
      } catch (_) {
        return;
      }
    }

    final data = jsonDecode(jsonString) as Map<String, dynamic>;
    final qList = data['questions'] as List<dynamic>;
    final questionsWithOptions = QuestionGeneratorService.generateFromSeedData(qList);

    await insertQuestionsBatch(questionsWithOptions);

    // Also populate generated practice questions per unit to ensure full 50-MCQ simulator coverage
    final allUnits = await db.select(db.units).get();
    for (final unit in allUnits) {
      final generatedBatch = QuestionGeneratorService.generatePracticeBatchForUnit(
        unitId: unit.id,
        unitTitle: unit.title,
        count: 5,
      );
      await insertQuestionsBatch(generatedBatch);
    }
  }

  Future<void> insertQuestionsBatch(List<QuestionWithOptions> items) async {
    for (final item in items) {
      await db.into(db.questions).insertOnConflictUpdate(QuestionsCompanion(
        id: Value(item.question.id),
        unitId: Value(item.question.unitId),
        topicId: Value(item.question.topicId),
        questionText: Value(item.question.questionText),
        explanation: Value(item.question.explanation),
        year: Value(item.question.year),
        isPyq: Value(item.question.isPyq),
        sourceType: Value(item.question.sourceType),
        difficulty: Value(item.question.difficulty),
      ));

      for (final opt in item.options) {
        await db.into(db.questionOptions).insertOnConflictUpdate(QuestionOptionsCompanion(
          id: Value(opt.id),
          questionId: Value(opt.questionId),
          optionLetter: Value(opt.optionLetter),
          textContent: Value(opt.textContent),
          isCorrect: Value(opt.isCorrect),
        ));
      }
    }
  }

  // --- Reactive Streams ---
  Stream<List<Subject>> watchSubjects() => db.select(db.subjects).watch();
  Stream<List<Unit>> watchUnits() => (db.select(db.units)..orderBy([(u) => OrderingTerm.asc(u.unitNumber)])).watch();
  Stream<List<Topic>> watchTopics(String unitId) =>
      (db.select(db.topics)..where((t) => t.unitId.equals(unitId))).watch();
  Stream<List<Note>> watchNotes(String unitId) =>
      (db.select(db.notes)..where((n) => n.unitId.equals(unitId))).watch();
  Stream<List<Note>> watchAllNotes() => db.select(db.notes).watch();

  Future<void> toggleNoteCompleted(String noteId, bool isCompleted) async {
    final now = DateTime.now();
    await (db.update(db.notes)..where((n) => n.id.equals(noteId))).write(
      NotesCompanion(
        isCompleted: Value(isCompleted),
        updatedAt: Value(now),
      ),
    );
    await recomputeReadinessScore('local_guest_user');
  }

  Future<void> toggleNoteBookmarked(String noteId, bool isBookmarked) async {
    final now = DateTime.now();
    await (db.update(db.notes)..where((n) => n.id.equals(noteId))).write(
      NotesCompanion(
        isBookmarked: Value(isBookmarked),
        updatedAt: Value(now),
      ),
    );
  }

  // --- Repetition-Controlled Question Fetching ---
  Future<List<QuestionWithOptions>> getQuestionsForUnit({
    required String unitId,
    int count = 10,
    required String userId,
    Set<String>? sessionSeenIds,
  }) async {
    final query = db.select(db.questions)..where((q) => q.unitId.equals(unitId));
    final rawQuestions = await query.get();
    if (rawQuestions.isNotEmpty) {
      return _applyRepetitionSelection(
        pool: rawQuestions,
        count: count,
        userId: userId,
        sessionSeenIds: sessionSeenIds ?? {},
      );
    }

    try {
      final jsonString = await rootBundle.loadString('assets/data/questions_seed.json');
      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      final qList = data['questions'] as List<dynamic>;
      final allParsed = QuestionGeneratorService.generateFromSeedData(qList);
      final unitFiltered = allParsed.where((q) => q.unitId == unitId).toList();
      return unitFiltered.take(count).toList();
    } catch (_) {
      return [];
    }
  }

  Future<List<QuestionWithOptions>> getExamSimulatorQuestions({
    required String userId,
    Set<String>? sessionSeenIds,
  }) async {
    // 100 MCQs: exactly 10 questions per each of the 10 units!
    final allUnits = await (db.select(db.units)..orderBy([(u) => OrderingTerm.asc(u.unitNumber)])).get();
    final List<QuestionWithOptions> examQuestions = [];

    for (final unit in allUnits) {
      final unitPool = await (db.select(db.questions)..where((q) => q.unitId.equals(unit.id))).get();
      final selectedForUnit = await _applyRepetitionSelection(
        pool: unitPool,
        count: 10,
        userId: userId,
        sessionSeenIds: sessionSeenIds ?? {},
      );
      examQuestions.addAll(selectedForUnit);
    }

    // In case questions are fewer than 100, backfill from entire question bank
    if (examQuestions.length < 100) {
      final remainingNeeded = 100 - examQuestions.length;
      final existingIds = examQuestions.map((q) => q.id).toSet();
      final allQuestions = await db.select(db.questions).get();
      final backfillPool = allQuestions.where((q) => !existingIds.contains(q.id)).toList();
      if (backfillPool.isNotEmpty) {
        final backfill = await _applyRepetitionSelection(
          pool: backfillPool,
          count: remainingNeeded,
          userId: userId,
          sessionSeenIds: {...(sessionSeenIds ?? {}), ...existingIds},
        );
        examQuestions.addAll(backfill);
      }
    }

    // Additional fallback from bundled seed questions if DB had not yet synced
    if (examQuestions.length < 100) {
      try {
        final jsonString = await rootBundle.loadString('assets/data/questions_seed.json');
        final data = jsonDecode(jsonString) as Map<String, dynamic>;
        final qList = data['questions'] as List<dynamic>;
        final allParsed = QuestionGeneratorService.generateFromSeedData(qList);
        final existingIds = examQuestions.map((q) => q.id).toSet();
        for (final q in allParsed) {
          if (!existingIds.contains(q.id)) {
            examQuestions.add(q);
            if (examQuestions.length >= 100) break;
          }
        }
      } catch (_) {}
    }

    return examQuestions;
  }

  Future<List<QuestionWithOptions>> getPyqQuestions({
    required int year,
    required String userId,
    Set<String>? sessionSeenIds,
  }) async {
    final query = db.select(db.questions)..where((q) => q.year.equals(year) & q.isPyq.equals(true));
    final pyqQuestions = await query.get();
    return _applyRepetitionSelection(
      pool: pyqQuestions,
      count: pyqQuestions.length,
      userId: userId,
      sessionSeenIds: sessionSeenIds ?? {},
    );
  }

  Future<List<QuestionWithOptions>> getPyqQuestionsFiltered({
    String? sourceType,
    int? year,
    String? unitId,
    required String userId,
    Set<String>? sessionSeenIds,
  }) async {
    final query = db.select(db.questions)
      ..where((q) {
        Expression<bool> predicate = q.isPyq.equals(true);
        if (sourceType != null && sourceType.isNotEmpty) {
          predicate = predicate & q.sourceType.equals(sourceType);
        }
        if (year != null) {
          predicate = predicate & q.year.equals(year);
        }
        if (unitId != null && unitId.isNotEmpty) {
          predicate = predicate & q.unitId.equals(unitId);
        }
        return predicate;
      });
    final pyqQuestions = await query.get();
    if (pyqQuestions.isNotEmpty) {
      return _applyRepetitionSelection(
        pool: pyqQuestions,
        count: pyqQuestions.length,
        userId: userId,
        sessionSeenIds: sessionSeenIds ?? {},
      );
    }

    // Fallback directly to bundled seed questions
    try {
      final jsonString = await rootBundle.loadString('assets/data/questions_seed.json');
      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      final qList = data['questions'] as List<dynamic>;
      final allParsed = QuestionGeneratorService.generateFromSeedData(qList);
      return allParsed.where((q) {
        if (!q.isPyq) return false;
        if (sourceType != null && sourceType.isNotEmpty && q.question.sourceType != sourceType) return false;
        if (year != null && q.question.year != year) return false;
        if (unitId != null && unitId.isNotEmpty && q.unitId != unitId) return false;
        return true;
      }).toList();
    } catch (_) {
      return [];
    }
  }

  Future<List<QuestionWithOptions>> _applyRepetitionSelection({
    required List<Question> pool,
    required int count,
    required String userId,
    required Set<String> sessionSeenIds,
  }) async {
    if (pool.isEmpty) return [];

    // Fetch user answer logs for pool question IDs
    final poolIds = pool.map((q) => q.id).toList();
    final logs = await (db.select(db.answerLogs)
          ..where((l) => l.userId.equals(userId) & l.questionId.isIn(poolIds)))
        .get();

    final Map<String, DateTime> questionLastSeenMap = {};
    for (final log in logs) {
      final existing = questionLastSeenMap[log.questionId];
      if (existing == null || log.timestamp.isAfter(existing)) {
        questionLastSeenMap[log.questionId] = log.timestamp;
      }
    }

    final selectedQuestions = _repetitionController.selectQuestions<Question>(
      pool: pool,
      getId: (q) => q.id,
      questionLastSeenMap: questionLastSeenMap,
      sessionSeenIds: sessionSeenIds,
      requestedCount: count,
    );

    // Hydrate options
    final selectedIds = selectedQuestions.map((q) => q.id).toList();
    final allOptions = await (db.select(db.questionOptions)..where((o) => o.questionId.isIn(selectedIds))).get();

    final Map<String, List<QuestionOption>> optionMap = {};
    for (final opt in allOptions) {
      optionMap.putIfAbsent(opt.questionId, () => []).add(opt);
    }
    return selectedQuestions.map((q) {
      final opts = optionMap[q.id] ?? [];
      opts.sort((a, b) => a.optionLetter.compareTo(b.optionLetter));
      return QuestionWithOptions(question: q, options: opts);
    }).toList();
  }

  Future<List<QuestionWithOptions>> getAllQuestionsWithOptions() async {
    final allQuestions = await db.select(db.questions).get();
    final allOptions = await db.select(db.questionOptions).get();
    final Map<String, List<QuestionOption>> optionMap = {};
    for (final opt in allOptions) {
      optionMap.putIfAbsent(opt.questionId, () => []).add(opt);
    }
    return allQuestions.map((q) {
      final opts = optionMap[q.id] ?? [];
      opts.sort((a, b) => a.optionLetter.compareTo(b.optionLetter));
      return QuestionWithOptions(question: q, options: opts);
    }).toList();
  }

  Future<void> logAnswer({
    required String userId,
    required String questionId,
    required String? selectedOptionId,
    required bool isCorrect,
    required String mode, // 'practice', 'exam', 'pyq'
    required String unitId,
  }) async {
    final now = DateTime.now();

    await db.into(db.answerLogs).insert(AnswerLogsCompanion(
      id: Value('ans_${_uuid.v4()}'),
      userId: Value(userId),
      questionId: Value(questionId),
      selectedOptionId: Value(selectedOptionId),
      isCorrect: Value(isCorrect),
      timestamp: Value(now),
      mode: Value(mode),
      updatedAt: Value(now),
    ));

    // Update Progress table for unit
    final existingProgress = await (db.select(db.progressTable)
          ..where((p) => p.userId.equals(userId) & p.unitId.equals(unitId)))
        .getSingleOrNull();

    if (existingProgress == null) {
      await db.into(db.progressTable).insert(ProgressTableCompanion(
        id: Value('prog_${_uuid.v4()}'),
        userId: Value(userId),
        unitId: Value(unitId),
        notesReadCount: const Value(0),
        questionsAttempted: const Value(1),
        questionsCorrect: Value(isCorrect ? 1 : 0),
        lastStudiedAt: Value(now),
        updatedAt: Value(now),
      ));
    } else {
      await (db.update(db.progressTable)..where((p) => p.id.equals(existingProgress.id))).write(
        ProgressTableCompanion(
          questionsAttempted: Value(existingProgress.questionsAttempted + 1),
          questionsCorrect: Value(existingProgress.questionsCorrect + (isCorrect ? 1 : 0)),
          lastStudiedAt: Value(now),
          updatedAt: Value(now),
        ),
      );
    }

    await recomputeReadinessScore(userId);
  }

  Future<void> resetQuestionPool(String userId, {String? unitId}) async {
    if (unitId != null) {
      final unitQuestions = await (db.select(db.questions)..where((q) => q.unitId.equals(unitId))).get();
      final ids = unitQuestions.map((q) => q.id).toList();
      await (db.delete(db.answerLogs)..where((l) => l.userId.equals(userId) & l.questionId.isIn(ids))).go();
    } else {
      await (db.delete(db.answerLogs)..where((l) => l.userId.equals(userId))).go();
    }
  }

  Future<void> saveExamAttempt(ExamAttempt attempt) async {
    await db.into(db.examAttempts).insertOnConflictUpdate(attempt);
    await recomputeReadinessScore(attempt.userId);
  }

  Stream<List<ExamAttempt>> watchExamAttempts(String userId) {
    return (db.select(db.examAttempts)
          ..where((e) => e.userId.equals(userId))
          ..orderBy([(e) => OrderingTerm.desc(e.startedAt)]))
        .watch();
  }

  Future<ReadinessBreakdown> recomputeReadinessScore(String userId) async {
    // 1. Notes completion
    final allNotes = await db.select(db.notes).get();
    final completedNotes = allNotes.where((n) => n.isCompleted).length;

    // 2. Quiz accuracy (mode == 'practice' or 'exam')
    final allLogs = await (db.select(db.answerLogs)..where((l) => l.userId.equals(userId))).get();
    final quizLogs = allLogs.where((l) => l.mode == 'practice' || l.mode == 'exam').toList();
    final quizCorrect = quizLogs.where((l) => l.isCorrect).length;

    // 3. PYQ accuracy (mode == 'pyq')
    final pyqLogs = allLogs.where((l) => l.mode == 'pyq').toList();
    final pyqCorrect = pyqLogs.where((l) => l.isCorrect).length;

    final breakdown = ReadinessCalculator.compute(
      totalNotes: allNotes.length,
      completedNotes: completedNotes,
      quizAttempted: quizLogs.length,
      quizCorrect: quizCorrect,
      pyqAttempted: pyqLogs.length,
      pyqCorrect: pyqCorrect,
    );

    final now = DateTime.now();
    await db.into(db.readinessScores).insertOnConflictUpdate(ReadinessScoresCompanion(
      id: Value('readiness_$userId'),
      userId: Value(userId),
      score: Value(breakdown.overallScore),
      notesProgressPct: Value(breakdown.notesProgressPct),
      quizAccuracyPct: Value(breakdown.quizAccuracyPct),
      pyqAccuracyPct: Value(breakdown.pyqAccuracyPct),
      computedAt: Value(now),
      updatedAt: Value(now),
    ));

    return breakdown;
  }

  Stream<ReadinessBreakdown> watchReadinessScore(String userId) {
    return (db.select(db.readinessScores)..where((r) => r.userId.equals(userId)))
        .watchSingleOrNull()
        .asyncMap((r) async {
      if (r == null) {
        return await recomputeReadinessScore(userId);
      }
      final allNotes = await db.select(db.notes).get();
      final completedNotes = allNotes.where((n) => n.isCompleted).length;
      final allLogs = await (db.select(db.answerLogs)..where((l) => l.userId.equals(userId))).get();
      final quizLogs = allLogs.where((l) => l.mode == 'practice' || l.mode == 'exam').toList();
      final pyqLogs = allLogs.where((l) => l.mode == 'pyq').toList();

      return ReadinessBreakdown(
        overallScore: r.score,
        notesProgressPct: r.notesProgressPct,
        quizAccuracyPct: r.quizAccuracyPct,
        pyqAccuracyPct: r.pyqAccuracyPct,
        totalNotes: allNotes.length,
        completedNotes: completedNotes,
        quizAttempted: quizLogs.length,
        quizCorrect: quizLogs.where((l) => l.isCorrect).length,
        pyqAttempted: pyqLogs.length,
        pyqCorrect: pyqLogs.where((l) => l.isCorrect).length,
      );
    });
  }

  Future<Map<String, dynamic>> getAnalytics(String userId) async {
    final units = await (db.select(db.units)..orderBy([(u) => OrderingTerm.asc(u.unitNumber)])).get();
    final progressList = await (db.select(db.progressTable)..where((p) => p.userId.equals(userId))).get();
    final attempts = await (db.select(db.examAttempts)
          ..where((e) => e.userId.equals(userId))
          ..orderBy([(e) => OrderingTerm.asc(e.startedAt)]))
        .get();

    final Map<String, ProgressTableData> progressMap = {
      for (final p in progressList) p.unitId: p
    };

    final List<Map<String, dynamic>> unitAnalytics = [];
    final List<Map<String, dynamic>> weakAreas = [];

    for (final unit in units) {
      final prog = progressMap[unit.id];
      final attempted = prog?.questionsAttempted ?? 0;
      final correct = prog?.questionsCorrect ?? 0;
      final double acc = attempted > 0 ? (correct / attempted) * 100.0 : 0.0;

      final data = {
        'unitId': unit.id,
        'unitNumber': unit.unitNumber,
        'code': unit.code,
        'title': unit.title,
        'attempted': attempted,
        'correct': correct,
        'accuracy': double.parse(acc.toStringAsFixed(1)),
      };
      unitAnalytics.add(data);

      if (attempted > 0 && acc < 60.0) {
        weakAreas.add(data);
      }
    }

    // Sort weak areas lowest accuracy first
    weakAreas.sort((a, b) => (a['accuracy'] as double).compareTo(b['accuracy'] as double));

    return {
      'unitAnalytics': unitAnalytics,
      'weakAreas': weakAreas,
      'totalAttempts': attempts.length,
      'recentAttempts': attempts.reversed.take(5).toList(),
      'passCount': attempts.where((a) => a.passed).length,
    };
  }
}
