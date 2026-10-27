import '../constants/app_constants.dart';

class ReadinessBreakdown {
  final double overallScore;
  final double notesProgressPct;
  final double quizAccuracyPct;
  final double pyqAccuracyPct;
  final int totalNotes;
  final int completedNotes;
  final int quizAttempted;
  final int quizCorrect;
  final int pyqAttempted;
  final int pyqCorrect;

  const ReadinessBreakdown({
    required this.overallScore,
    required this.notesProgressPct,
    required this.quizAccuracyPct,
    required this.pyqAccuracyPct,
    required this.totalNotes,
    required this.completedNotes,
    required this.quizAttempted,
    required this.quizCorrect,
    required this.pyqAttempted,
    required this.pyqCorrect,
  });

  String get readinessTier {
    if (overallScore >= 80) return 'Exam Ready';
    if (overallScore >= 65) return 'Proficient';
    if (overallScore >= 50) return 'Passing Target';
    if (overallScore >= 25) return 'Building Foundations';
    return 'Just Started';
  }
}

class ReadinessCalculator {
  /// Computes the official readiness score according to:
  /// Readiness = 0.4 * (notes completed %) + 0.4 * (average quiz accuracy) + 0.2 * (PYQ accuracy)
  /// All values are bounded to [0.0, 100.0] and division-by-zero is strictly handled.
  static ReadinessBreakdown compute({
    required int totalNotes,
    required int completedNotes,
    required int quizAttempted,
    required int quizCorrect,
    required int pyqAttempted,
    required int pyqCorrect,
  }) {
    // 1. Notes Completed %
    final double notesPct = (totalNotes > 0)
        ? ((completedNotes / totalNotes) * 100.0).clamp(0.0, 100.0)
        : 0.0;

    // 2. Quiz Accuracy %
    final double quizPct = (quizAttempted > 0)
        ? ((quizCorrect / quizAttempted) * 100.0).clamp(0.0, 100.0)
        : 0.0;

    // 3. PYQ Accuracy %
    final double pyqPct = (pyqAttempted > 0)
        ? ((pyqCorrect / pyqAttempted) * 100.0).clamp(0.0, 100.0)
        : 0.0;

    // Overall Score
    final double score = (
      (AppConstants.readinessNotesWeight * notesPct) +
      (AppConstants.readinessQuizWeight * quizPct) +
      (AppConstants.readinessPyqWeight * pyqPct)
    ).clamp(0.0, 100.0);

    return ReadinessBreakdown(
      overallScore: double.parse(score.toStringAsFixed(1)),
      notesProgressPct: double.parse(notesPct.toStringAsFixed(1)),
      quizAccuracyPct: double.parse(quizPct.toStringAsFixed(1)),
      pyqAccuracyPct: double.parse(pyqPct.toStringAsFixed(1)),
      totalNotes: totalNotes,
      completedNotes: completedNotes,
      quizAttempted: quizAttempted,
      quizCorrect: quizCorrect,
      pyqAttempted: pyqAttempted,
      pyqCorrect: pyqCorrect,
    );
  }
}
