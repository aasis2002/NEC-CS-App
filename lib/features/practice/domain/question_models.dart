import '../../../core/database/app_database.dart';

class QuestionWithOptions {
  final Question question;
  final List<QuestionOption> options;

  const QuestionWithOptions({
    required this.question,
    required this.options,
  });

  String get id => question.id;
  String get text => question.questionText;
  String get explanation => question.explanation;
  String get unitId => question.unitId;
  String get topicId => question.topicId;
  int? get year => question.year;
  bool get isPyq => question.isPyq;
  String get difficulty => question.difficulty;

  QuestionOption? get correctOption {
    for (final opt in options) {
      if (opt.isCorrect) return opt;
    }
    return options.isNotEmpty ? options.first : null;
  }
}

class ExamQuestionAnswer {
  final QuestionWithOptions questionWithOptions;
  final String? selectedOptionId;
  final bool isFlagged;

  const ExamQuestionAnswer({
    required this.questionWithOptions,
    this.selectedOptionId,
    this.isFlagged = false,
  });

  bool get isAnswered => selectedOptionId != null;
  bool get isCorrect => selectedOptionId != null && selectedOptionId == questionWithOptions.correctOption?.id;

  ExamQuestionAnswer copyWith({
    String? selectedOptionId,
    bool? isFlagged,
  }) {
    return ExamQuestionAnswer(
      questionWithOptions: questionWithOptions,
      selectedOptionId: selectedOptionId ?? this.selectedOptionId,
      isFlagged: isFlagged ?? this.isFlagged,
    );
  }
}
