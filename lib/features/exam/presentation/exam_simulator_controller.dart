import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:uuid/uuid.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/database/app_database.dart';
import '../../../core/database/nec_repository.dart';
import '../../../core/providers/app_providers.dart';
import '../domain/exam_state.dart';
import '../../practice/domain/question_models.dart';

final examSimulatorProvider =
    ChangeNotifierProvider.autoDispose<ExamSimulatorController>((ref) {
  final repo = ref.watch(repositoryProvider);
  final userId = ref.watch(currentUserIdProvider);
  final controller = ExamSimulatorController(repo, userId);
  return controller;
});

class ExamSimulatorController extends ChangeNotifier {
  final NecRepository _repo;
  final String _userId;
  Timer? _timer;
  final _uuid = const Uuid();

  ExamState state = ExamState.initial();

  ExamSimulatorController(this._repo, this._userId);

  Future<void> initializeExam({List<QuestionWithOptions>? preloadedQuestions}) async {
    state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      List<QuestionWithOptions> questions;
      if (preloadedQuestions != null && preloadedQuestions.isNotEmpty) {
        questions = preloadedQuestions;
      } else {
        questions = await _repo.getExamSimulatorQuestions(userId: _userId);
      }

      state = ExamState(
        questions: questions,
        currentIndex: 0,
        selectedAnswers: {},
        flaggedQuestionIds: {},
        remainingSeconds: AppConstants.examDurationSeconds,
        isLoading: false,
        isSubmitted: false,
        startedAt: DateTime.now(),
      );

      _startTimer();
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
    notifyListeners();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds > 0 && !state.isSubmitted) {
        state = state.copyWith(remainingSeconds: state.remainingSeconds - 1);
        notifyListeners();
      } else {
        _timer?.cancel();
        if (!state.isSubmitted) {
          submitExam();
        }
      }
    });
  }

  void selectAnswer(String questionId, String optionId) {
    if (state.isSubmitted) return;
    final updated = Map<String, String>.from(state.selectedAnswers);
    updated[questionId] = optionId;
    state = state.copyWith(selectedAnswers: updated);
    notifyListeners();
  }

  void toggleFlag(String questionId) {
    if (state.isSubmitted) return;
    final updated = Set<String>.from(state.flaggedQuestionIds);
    if (updated.contains(questionId)) {
      updated.remove(questionId);
    } else {
      updated.add(questionId);
    }
    state = state.copyWith(flaggedQuestionIds: updated);
    notifyListeners();
  }

  void jumpToQuestion(int index) {
    if (index >= 0 && index < state.questions.length) {
      state = state.copyWith(currentIndex: index);
      notifyListeners();
    }
  }

  void nextQuestion() {
    if (state.currentIndex < state.questions.length - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (state.currentIndex > 0) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
      notifyListeners();
    }
  }

  Future<void> submitExam() async {
    if (state.isSubmitted) return;
    _timer?.cancel();

    int totalScore = 0;
    final Map<String, int> unitScore = {};
    final Map<String, int> unitTotal = {};
    final now = DateTime.now();
    final int durationSeconds = AppConstants.examDurationSeconds - state.remainingSeconds;

    for (final q in state.questions) {
      final unitId = q.unitId;
      unitTotal[unitId] = (unitTotal[unitId] ?? 0) + 1;

      final selectedOptId = state.selectedAnswers[q.id];
      final isCorrect = selectedOptId != null && selectedOptId == q.correctOption?.id;

      if (isCorrect) {
        totalScore++;
        unitScore[unitId] = (unitScore[unitId] ?? 0) + 1;
      } else {
        unitScore.putIfAbsent(unitId, () => 0);
      }

      await _repo.logAnswer(
        userId: _userId,
        questionId: q.id,
        selectedOptionId: selectedOptId,
        isCorrect: isCorrect,
        mode: 'exam',
        unitId: unitId,
      );
    }

    final bool passed = totalScore >= AppConstants.examPassScore;
    final attemptId = 'attempt_${_uuid.v4()}';

    final attempt = ExamAttempt(
      id: attemptId,
      userId: _userId,
      title: 'NEC CSE Full Simulator (50 MCQs)',
      startedAt: state.startedAt ?? now.subtract(Duration(seconds: durationSeconds)),
      completedAt: now,
      durationSeconds: durationSeconds,
      score: totalScore,
      totalQuestions: state.questions.length,
      passed: passed,
      answersJson: jsonEncode(state.selectedAnswers),
      isPyq: false,
      year: null,
      updatedAt: now,
    );

    await _repo.saveExamAttempt(attempt);

    state = state.copyWith(
      isSubmitted: true,
      completedAttempt: attempt,
      perUnitScore: unitScore,
      perUnitTotal: unitTotal,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
