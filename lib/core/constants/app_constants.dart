class AppConstants {
  static const String appName = 'NEC CS';
  static const String appVersion = '2.0.0';

  // Exam rules: 100 MCQs, 2 Hours, 100 Marks, Pass Mark 50
  static const int examTotalQuestions = 100;
  static const int examDurationMinutes = 120;
  static const int examDurationSeconds = examDurationMinutes * 60; // 7200s
  static const int examPassScore = 50; // 50% of 100
  static const double examPassPercentage = 50.0;
  static const int questionsPerUnitExam = 10;

  // Readiness Formula Weights
  static const double readinessNotesWeight = 0.4;
  static const double readinessQuizWeight = 0.4;
  static const double readinessPyqWeight = 0.2;

  // Available PYQ BS Years & Sets
  static const List<int> pyqYears = [2081, 2080, 2079, 2078, 2077, 2076, 2075];

  // Syllabus Chapters count
  static const int totalUnits = 10;
}
