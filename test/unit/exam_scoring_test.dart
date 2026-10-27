import 'package:flutter_test/flutter_test.dart';
import 'package:nec_cs/core/constants/app_constants.dart';
import 'package:nec_cs/features/exam/domain/exam_state.dart';

void main() {
  group('Exam Simulator & Scoring Unit Tests', () {
    test('Exam Duration and Constants: 100 Questions, 120 mins, Pass score 50', () {
      expect(AppConstants.examTotalQuestions, 100);
      expect(AppConstants.examDurationMinutes, 120);
      expect(AppConstants.examDurationSeconds, 7200);
      expect(AppConstants.examPassScore, 50);
      expect(AppConstants.examPassPercentage, 50.0);
    });

    test('ExamState Initial Formatted Timer', () {
      final state = ExamState.initial();
      expect(state.remainingSeconds, 7200);
      expect(state.formattedTimer, '120:00');
    });

    test('ExamState formattedTimer at 4 minutes and 5 seconds', () {
      final state = ExamState.initial().copyWith(remainingSeconds: 245);
      expect(state.formattedTimer, '04:05');
    });

    test('Pass/Fail Criteria: Score 50/100 is Passed, 49/100 is Failed', () {
      const total = 100;
      final passingScore = 50;
      final failingScore = 49;

      final isPass = passingScore >= AppConstants.examPassScore;
      final isFail = failingScore >= AppConstants.examPassScore;

      expect(isPass, isTrue);
      expect(isFail, isFalse);

      final passPct = (passingScore / total) * 100;
      final failPct = (failingScore / total) * 100;

      expect(passPct, 50.0);
      expect(failPct, 49.0);
    });

    test('Flagging and answering counts tracking', () {
      var state = ExamState.initial();
      expect(state.answeredCount, 0);
      expect(state.flaggedCount, 0);

      state = state.copyWith(
        selectedAnswers: {'q1': 'opt_a', 'q2': 'opt_b'},
        flaggedQuestionIds: {'q2', 'q3'},
      );

      expect(state.answeredCount, 2);
      expect(state.flaggedCount, 2);
    });
  });
}
