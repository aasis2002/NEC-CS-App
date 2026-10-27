import 'package:flutter_test/flutter_test.dart';
import 'package:nec_cs/core/utils/readiness_calculator.dart';

void main() {
  group('ReadinessCalculator Unit Tests', () {
    test('Zero Data Test: Handles zero values without division by zero', () {
      final breakdown = ReadinessCalculator.compute(
        totalNotes: 0,
        completedNotes: 0,
        quizAttempted: 0,
        quizCorrect: 0,
        pyqAttempted: 0,
        pyqCorrect: 0,
      );

      expect(breakdown.overallScore, 0.0);
      expect(breakdown.notesProgressPct, 0.0);
      expect(breakdown.quizAccuracyPct, 0.0);
      expect(breakdown.pyqAccuracyPct, 0.0);
      expect(breakdown.readinessTier, 'Just Started');
    });

    test('Max Data Test: 100% on notes, quiz, and PYQs yields 100.0 readiness', () {
      final breakdown = ReadinessCalculator.compute(
        totalNotes: 10,
        completedNotes: 10,
        quizAttempted: 50,
        quizCorrect: 50,
        pyqAttempted: 20,
        pyqCorrect: 20,
      );

      expect(breakdown.overallScore, 100.0);
      expect(breakdown.notesProgressPct, 100.0);
      expect(breakdown.quizAccuracyPct, 100.0);
      expect(breakdown.pyqAccuracyPct, 100.0);
      expect(breakdown.readinessTier, 'Exam Ready');
    });

    test('Weighted Formula Verification: 0.4*Notes + 0.4*Quiz + 0.2*PYQ', () {
      // Notes: 5/10 = 50% -> 0.4 * 50 = 20.0
      // Quiz: 40/50 = 80% -> 0.4 * 80 = 32.0
      // PYQ: 12/20 = 60%  -> 0.2 * 60 = 12.0
      // Expected Total: 20.0 + 32.0 + 12.0 = 64.0
      final breakdown = ReadinessCalculator.compute(
        totalNotes: 10,
        completedNotes: 5,
        quizAttempted: 50,
        quizCorrect: 40,
        pyqAttempted: 20,
        pyqCorrect: 12,
      );

      expect(breakdown.notesProgressPct, 50.0);
      expect(breakdown.quizAccuracyPct, 80.0);
      expect(breakdown.pyqAccuracyPct, 60.0);
      expect(breakdown.overallScore, 64.0);
      expect(breakdown.readinessTier, 'Passing Target');
    });

    test('Partial Data with No PYQs yet', () {
      // Notes: 10/10 = 100% -> 0.4 * 100 = 40.0
      // Quiz: 25/50 = 50%   -> 0.4 * 50 = 20.0
      // PYQ: 0 attempted    -> 0.0
      // Total: 40.0 + 20.0 + 0 = 60.0
      final breakdown = ReadinessCalculator.compute(
        totalNotes: 10,
        completedNotes: 10,
        quizAttempted: 50,
        quizCorrect: 25,
        pyqAttempted: 0,
        pyqCorrect: 0,
      );

      expect(breakdown.overallScore, 60.0);
      expect(breakdown.readinessTier, 'Passing Target');
    });
  });
}
