import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/database/app_database.dart';
import '../../../core/theme/app_theme.dart';
import '../../practice/domain/question_models.dart';

class ExamResultsScreen extends StatelessWidget {
  final ExamAttempt attempt;
  final List<QuestionWithOptions> questions;
  final Map<String, String> userAnswers;
  final Map<String, int> perUnitScore;
  final Map<String, int> perUnitTotal;

  const ExamResultsScreen({
    super.key,
    required this.attempt,
    required this.questions,
    required this.userAnswers,
    required this.perUnitScore,
    required this.perUnitTotal,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bool passed = attempt.score >= AppConstants.examPassScore;
    final double pct = attempt.totalQuestions > 0
        ? (attempt.score / attempt.totalQuestions) * 100
        : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Simulator Results'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Result Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: passed ? AppTheme.successGreen.withAlpha(25) : AppTheme.errorRed.withAlpha(25),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: passed ? AppTheme.successGreen : AppTheme.errorRed,
                  width: 1.5,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    passed ? Icons.check_circle_rounded : Icons.cancel_rounded,
                    size: 54,
                    color: passed ? AppTheme.successGreen : AppTheme.errorRed,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    passed ? 'CONGRATULATIONS! YOU PASSED' : 'DID NOT PASS (BELOW 50%)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: passed ? AppTheme.successGreen : AppTheme.errorRed,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Score: ${attempt.score} / ${attempt.totalQuestions} (${pct.toStringAsFixed(1)}%)',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'NEC License Standard: 50% (50/100) • No Negative Marking',
                    style: TextStyle(fontSize: 11, color: isDark ? Colors.grey.shade400 : Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 2. Per-Unit Score Breakdown
            Text(
              'Per-Chapter Syllabus Breakdown (10 Qs each)',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: perUnitTotal.keys.map((unitId) {
                    final correct = perUnitScore[unitId] ?? 0;
                    final total = perUnitTotal[unitId] ?? 10;
                    final unitPct = total > 0 ? (correct / total) * 100 : 0.0;
                    final isUnitPass = unitPct >= 50.0;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 70,
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.grey.withAlpha(25),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              unitId.toUpperCase().replaceAll('_', ' '),
                              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: total > 0 ? correct / total : 0,
                                minHeight: 8,
                                backgroundColor: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                                valueColor: AlwaysStoppedAnimation(
                                  isUnitPass ? AppTheme.successGreen : AppTheme.errorRed,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '$correct / $total',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: isUnitPass ? AppTheme.successGreen : AppTheme.errorRed,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 3. Question-by-Question Review with Explanations
            Text(
              'Detailed Question Review',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final q = questions[index];
                final userChoiceId = userAnswers[q.id];
                final correctOpt = q.correctOption;
                final isUserCorrect = userChoiceId != null && userChoiceId == correctOpt?.id;

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: isUserCorrect ? AppTheme.successGreen.withAlpha(25) : AppTheme.errorRed.withAlpha(25),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Q${index + 1} • ${isUserCorrect ? 'Correct' : (userChoiceId == null ? 'Unanswered' : 'Wrong')}',
                                style: TextStyle(
                                  color: isUserCorrect ? AppTheme.successGreen : AppTheme.errorRed,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              q.unitId.toUpperCase().replaceAll('_', ' '),
                              style: const TextStyle(fontSize: 11, color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          q.text,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                        const SizedBox(height: 12),

                        // Options Preview
                        ...q.options.map((opt) {
                          final isSelected = userChoiceId == opt.id;
                          final isCorrect = opt.isCorrect;

                          Color? color;
                          if (isCorrect) color = AppTheme.successGreen;
                          if (isSelected && !isCorrect) color = AppTheme.errorRed;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Text(
                                  '${opt.optionLetter}. ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: color ?? Colors.grey,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    opt.textContent,
                                    style: TextStyle(
                                      color: color,
                                      fontWeight: isCorrect || isSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                ),
                                if (isCorrect)
                                  const Icon(Icons.check, size: 16, color: AppTheme.successGreen),
                                if (isSelected && !isCorrect)
                                  const Icon(Icons.close, size: 16, color: AppTheme.errorRed),
                              ],
                            ),
                          );
                        }),

                        if (q.explanation.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF0F172A) : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Explanation: ${q.explanation}',
                              style: TextStyle(fontSize: 12, color: isDark ? Colors.grey.shade400 : Colors.grey.shade700),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                child: const Text('Back to Dashboard'),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
