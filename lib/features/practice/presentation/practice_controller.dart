import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../core/database/nec_repository.dart';
import '../../../core/providers/app_providers.dart';
import '../domain/question_models.dart';

class PracticeQuizState {
  final List<QuestionWithOptions> questions;
  final int currentIndex;
  final Map<String, String> selectedAnswers;
  final bool immediateFeedback;
  final bool isLoading;
  final bool isCompleted;

  const PracticeQuizState({
    required this.questions,
    required this.currentIndex,
    required this.selectedAnswers,
    required this.immediateFeedback,
    required this.isLoading,
    required this.isCompleted,
  });

  factory PracticeQuizState.initial() => const PracticeQuizState(
        questions: [],
        currentIndex: 0,
        selectedAnswers: {},
        immediateFeedback: true,
        isLoading: false,
        isCompleted: false,
      );

  QuestionWithOptions? get currentQuestion =>
      (questions.isNotEmpty && currentIndex >= 0 && currentIndex < questions.length)
          ? questions[currentIndex]
          : null;

  int get score {
    int s = 0;
    for (final q in questions) {
      if (selectedAnswers[q.id] == q.correctOption?.id) {
        s++;
      }
    }
    return s;
  }

  PracticeQuizState copyWith({
    List<QuestionWithOptions>? questions,
    int? currentIndex,
    Map<String, String>? selectedAnswers,
    bool? immediateFeedback,
    bool? isLoading,
    bool? isCompleted,
  }) {
    return PracticeQuizState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      immediateFeedback: immediateFeedback ?? this.immediateFeedback,
      isLoading: isLoading ?? this.isLoading,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

final practiceQuizProvider =
    ChangeNotifierProvider.autoDispose<PracticeQuizController>((ref) {
  final repo = ref.watch(repositoryProvider);
  final userId = ref.watch(currentUserIdProvider);
  return PracticeQuizController(repo, userId);
});

class PracticeQuizController extends ChangeNotifier {
  final NecRepository _repo;
  final String _userId;

  PracticeQuizState state = PracticeQuizState.initial();

  PracticeQuizController(this._repo, this._userId);

  Future<void> loadQuiz({required String unitId, int count = 10, bool immediateFeedback = true}) async {
    state = state.copyWith(isLoading: true);
    notifyListeners();
    try {
      final questions = await _repo.getQuestionsForUnit(
        unitId: unitId,
        count: count,
        userId: _userId,
      );

      state = PracticeQuizState(
        questions: questions,
        currentIndex: 0,
        selectedAnswers: {},
        immediateFeedback: immediateFeedback,
        isLoading: false,
        isCompleted: false,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
    notifyListeners();
  }

  Future<void> answerQuestion(String questionId, String optionId) async {
    if (state.selectedAnswers.containsKey(questionId)) return;

    final updated = Map<String, String>.from(state.selectedAnswers);
    updated[questionId] = optionId;

    final currentQ = state.currentQuestion;
    final isCorrect = currentQ != null && currentQ.correctOption?.id == optionId;

    await _repo.logAnswer(
      userId: _userId,
      questionId: questionId,
      selectedOptionId: optionId,
      isCorrect: isCorrect,
      mode: 'practice',
      unitId: currentQ?.unitId ?? 'unit_1',
    );

    state = state.copyWith(selectedAnswers: updated);
    notifyListeners();
  }

  void nextQuestion() {
    if (state.currentIndex < state.questions.length - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    } else {
      state = state.copyWith(isCompleted: true);
    }
    notifyListeners();
  }

  void previousQuestion() {
    if (state.currentIndex > 0) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
      notifyListeners();
    }
  }

  Future<void> resetPool(String unitId) async {
    await _repo.resetQuestionPool(_userId, unitId: unitId);
    await loadQuiz(unitId: unitId, immediateFeedback: state.immediateFeedback);
  }
}
