import 'package:flutter_test/flutter_test.dart';
import 'package:nec_cs/core/services/question_generator_service.dart';

void main() {
  group('Mock Exam 100 Questions Verification', () {
    test('generateModelSet generates exactly 100 questions for Set 1', () {
      final questions = QuestionGeneratorService.generateModelSet(
        setNumber: 1,
        count: 100,
      );

      expect(questions.length, 100);

      // Verify all 10 units are present and each unit has 10 questions
      final unitCounts = <String, int>{};
      for (final q in questions) {
        unitCounts[q.unitId] = (unitCounts[q.unitId] ?? 0) + 1;
        // Verify each question has exactly 4 options
        expect(q.options.length, 4);
        // Verify exactly one option is marked correct
        final correctCount = q.options.where((opt) => opt.isCorrect).length;
        expect(correctCount, 1);
      }

      for (int u = 1; u <= 10; u++) {
        expect(unitCounts['unit_$u'], 10, reason: 'Unit $u should have exactly 10 questions');
      }
    });

    test('generateModelSet default count is 100', () {
      final questions = QuestionGeneratorService.generateModelSet(
        setNumber: 1,
      );

      expect(questions.length, 100);
    });
  });
}
