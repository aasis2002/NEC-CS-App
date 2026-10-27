import '../../../core/constants/app_constants.dart';
import '../../../core/database/app_database.dart';
import '../../practice/domain/question_models.dart';

class ExamState {
  final List<QuestionWithOptions> questions;
  final int currentIndex;
  final Map<String, String> selectedAnswers; // questionId -> optionId
  final Set<String> flaggedQuestionIds;
  final int remainingSeconds;
  final bool isLoading;
  final bool isSubmitted;
  final DateTime? startedAt;
  final ExamAttempt? completedAttempt;
  final Map<String, int> perUnitScore;
  final Map<String, int> perUnitTotal;

  const ExamState({
    required this.questions,
    required this.currentIndex,
    required this.selectedAnswers,
    required this.flaggedQuestionIds,
    required this.remainingSeconds,
    required this.isLoading,
    required this.isSubmitted,
    this.startedAt,
    this.completedAttempt,
    this.perUnitScore = const {},
    this.perUnitTotal = const {},
  });

  factory ExamState.initial() {
    return const ExamState(
      questions: [],
      currentIndex: 0,
      selectedAnswers: {},
      flaggedQuestionIds: {},
      remainingSeconds: AppConstants.examDurationSeconds,
      isLoading: false,
      isSubmitted: false,
    );
  }

  QuestionWithOptions? get currentQuestion =>
      (questions.isNotEmpty && currentIndex >= 0 && currentIndex < questions.length)
          ? questions[currentIndex]
          : null;

  int get answeredCount => selectedAnswers.length;
  int get remainingCount => questions.length - answeredCount;
  int get flaggedCount => flaggedQuestionIds.length;

  String get formattedTimer {
    final minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  ExamState copyWith({
    List<QuestionWithOptions>? questions,
    int? currentIndex,
    Map<String, String>? selectedAnswers,
    Set<String>? flaggedQuestionIds,
    int? remainingSeconds,
    bool? isLoading,
    bool? isSubmitted,
    DateTime? startedAt,
    ExamAttempt? completedAttempt,
    Map<String, int>? perUnitScore,
    Map<String, int>? perUnitTotal,
  }) {
    return ExamState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      flaggedQuestionIds: flaggedQuestionIds ?? this.flaggedQuestionIds,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      isLoading: isLoading ?? this.isLoading,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      startedAt: startedAt ?? this.startedAt,
      completedAttempt: completedAttempt ?? this.completedAttempt,
      perUnitScore: perUnitScore ?? this.perUnitScore,
      perUnitTotal: perUnitTotal ?? this.perUnitTotal,
    );
  }
}
