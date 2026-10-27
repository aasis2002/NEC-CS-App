import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/animations/nec_animations.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/nec_animated_loading.dart';
import '../../practice/presentation/practice_screen.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsAsync = ref.watch(analyticsFutureProvider);
    final attemptsAsync = ref.watch(examAttemptsStreamProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance Analytics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh analytics',
            onPressed: () => ref.refresh(analyticsFutureProvider),
          ),
        ],
      ),
      body: analyticsAsync.when(
        data: (data) {
          final unitAnalytics = data['unitAnalytics'] as List<dynamic>? ?? [];
          final weakAreas = data['weakAreas'] as List<dynamic>? ?? [];
          final totalAttempts = data['totalAttempts'] as int? ?? 0;
          final passCount = data['passCount'] as int? ?? 0;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. High Level Summary Cards
                Row(
                  children: [
                    Expanded(
                      child: _buildSummaryCard(
                        title: 'Total Mock Exams',
                        value: '$totalAttempts',
                        subtitle: '$passCount Passed',
                        icon: Icons.assignment_turned_in_outlined,
                        color: AppTheme.primaryBlue,
                        isDark: isDark,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildSummaryCard(
                        title: 'Exam Pass Rate',
                        value: totalAttempts > 0 ? '${((passCount / totalAttempts) * 100).toInt()}%' : '0%',
                        subtitle: 'Pass Mark: 50%',
                        icon: Icons.emoji_events_outlined,
                        color: AppTheme.successGreen,
                        isDark: isDark,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // 2. Weak-Area Focus List
                Text(
                  'Focus & Weak Areas (Needs Attention)',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                if (weakAreas.isEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Icon(Icons.verified, color: AppTheme.successGreen, size: 28),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('No Severe Weak Areas Detected!', style: TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 2),
                                Text(
                                  'Keep attempting practice quizzes to uncover topics that need revision.',
                                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  ...weakAreas.map((w) {
                    return Card(
                      child: ListTile(
                        leading: Container(
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppTheme.errorRed.withAlpha(20),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.warning_amber_rounded, color: AppTheme.errorRed, size: 20),
                        ),
                        title: Text(
                          '${w['code']}: ${w['title']}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        subtitle: Text(
                          'Accuracy: ${w['accuracy']}% (${w['correct']}/${w['attempted']} correct)',
                          style: const TextStyle(fontSize: 11, color: AppTheme.errorRed),
                        ),
                        trailing: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              NecAnimations.sharedAxisRoute(
                                page: PracticeScreen(initialUnitId: w['unitId'] as String),
                              ),
                            );
                          },
                          child: const Text('Drill Unit', style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    );
                  }),

                const SizedBox(height: 24),

                // 3. Accuracy by All 10 Syllabus Units
                Text(
                  'Accuracy by All 10 Units',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: unitAnalytics.map((u) {
                        final double acc = (u['accuracy'] as num).toDouble();
                        final int attempted = u['attempted'] as int;
                        final isHigh = acc >= 60.0;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Unit ${u['unitNumber']}: ${u['code']}',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                  ),
                                  const Spacer(),
                                  Text(
                                    attempted == 0 ? 'Not practiced yet' : '$acc% ($attempted Qs)',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: attempted == 0
                                          ? Colors.grey
                                          : (isHigh ? AppTheme.successGreen : AppTheme.errorRed),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                  value: attempted == 0 ? 0.0 : (acc / 100.0).clamp(0.0, 1.0),
                                  minHeight: 6,
                                  backgroundColor: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                                  valueColor: AlwaysStoppedAnimation(
                                    attempted == 0
                                        ? Colors.grey.shade600
                                        : (isHigh ? AppTheme.successGreen : AppTheme.errorRed),
                                  ),
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

                // 4. Trend Over Exam Simulator Attempts
                Text(
                  'Recent 50-MCQ Exam Attempts Trend',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                attemptsAsync.when(
                  data: (attempts) {
                    if (attempts.isEmpty) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: Text(
                              'No mock exams taken yet. Take a 50-MCQ simulator to track your trajectory!',
                              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                            ),
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: attempts.take(5).length,
                      separatorBuilder: (_, _) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final att = attempts[index];
                        final passed = att.score >= AppConstants.examPassScore;
                        return Card(
                          child: ListTile(
                            leading: Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                color: passed ? AppTheme.successGreen.withAlpha(20) : AppTheme.errorRed.withAlpha(20),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                passed ? Icons.check_circle : Icons.cancel,
                                color: passed ? AppTheme.successGreen : AppTheme.errorRed,
                              ),
                            ),
                            title: Text(att.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            subtitle: Text(
                              'Score: ${att.score}/${att.totalQuestions} • Duration: ${(att.durationSeconds / 60).round()} mins',
                              style: const TextStyle(fontSize: 11),
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: passed ? AppTheme.successGreen.withAlpha(20) : AppTheme.errorRed.withAlpha(20),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                passed ? 'PASSED' : 'FAILED',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: passed ? AppTheme.successGreen : AppTheme.errorRed,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(
                    child: NecAnimatedLoading(message: 'Loading attempt history...'),
                  ),
                  error: (e, _) => Text('Error: $e'),
                ),

                const SizedBox(height: 40),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: NecAnimatedLoading(message: 'Computing exam analytics...'),
        ),
        error: (e, _) => Center(child: Text('Error loading analytics: $e')),
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
    required bool isDark,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
                Icon(icon, color: color, size: 20),
              ],
            ),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 2),
            Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
