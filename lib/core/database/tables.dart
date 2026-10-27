import 'package:drift/drift.dart';

class Users extends Table {
  TextColumn get id => text()();
  TextColumn get email => text()();
  TextColumn get displayName => text()();
  BoolColumn get isGuest => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastLoginAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Subjects extends Table {
  TextColumn get id => text()();
  TextColumn get code => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  IntColumn get orderIndex => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

class Units extends Table {
  TextColumn get id => text()();
  TextColumn get subjectId => text()();
  IntColumn get unitNumber => integer()();
  TextColumn get code => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  IntColumn get weightageQuestions => integer().withDefault(const Constant(5))();

  @override
  Set<Column> get primaryKey => {id};
}

class Topics extends Table {
  TextColumn get id => text()();
  TextColumn get unitId => text()();
  TextColumn get topicNumber => text()();
  TextColumn get code => text()();
  TextColumn get title => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Notes extends Table {
  TextColumn get id => text()();
  TextColumn get unitId => text()();
  TextColumn get topicId => text()();
  TextColumn get title => text()();
  TextColumn get filePath => text()();
  IntColumn get estimatedReadMinutes => integer().withDefault(const Constant(5))();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  BoolColumn get isBookmarked => boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Questions extends Table {
  TextColumn get id => text()();
  TextColumn get unitId => text()();
  TextColumn get topicId => text()();
  TextColumn get questionText => text()();
  TextColumn get explanation => text()();
  IntColumn get year => integer().nullable()();
  BoolColumn get isPyq => boolean().withDefault(const Constant(false))();
  TextColumn get sourceType => text()();
  TextColumn get difficulty => text().withDefault(const Constant('medium'))();

  @override
  Set<Column> get primaryKey => {id};
}

class QuestionOptions extends Table {
  TextColumn get id => text()();
  TextColumn get questionId => text()();
  TextColumn get optionLetter => text()();
  TextColumn get textContent => text()();
  BoolColumn get isCorrect => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

class ExamAttempts extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get title => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  IntColumn get durationSeconds => integer()();
  IntColumn get score => integer()();
  IntColumn get totalQuestions => integer()();
  BoolColumn get passed => boolean()();
  TextColumn get answersJson => text()();
  BoolColumn get isPyq => boolean().withDefault(const Constant(false))();
  IntColumn get year => integer().nullable()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class AnswerLogs extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get questionId => text()();
  TextColumn get selectedOptionId => text().nullable()();
  BoolColumn get isCorrect => boolean()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get mode => text()(); // practice, exam, pyq
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class ProgressTable extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get unitId => text()();
  IntColumn get notesReadCount => integer().withDefault(const Constant(0))();
  IntColumn get questionsAttempted => integer().withDefault(const Constant(0))();
  IntColumn get questionsCorrect => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastStudiedAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class ReadinessScores extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  RealColumn get score => real()();
  RealColumn get notesProgressPct => real()();
  RealColumn get quizAccuracyPct => real()();
  RealColumn get pyqAccuracyPct => real()();
  DateTimeColumn get computedAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
