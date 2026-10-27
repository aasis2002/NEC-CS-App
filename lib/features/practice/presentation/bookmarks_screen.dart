import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/animations/nec_animations.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/providers/bookmarks_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/nec_animated_empty_state.dart';
import '../../../core/widgets/nec_animated_loading.dart';
import '../../../core/widgets/necx_app_bar.dart';

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarkedAsync = ref.watch(bookmarkedQuestionsFutureProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const NecAppBar(
        title: 'Saved Questions',
        showBackButton: true,
      ),
      body: bookmarkedAsync.when(
        loading: () => const NecAnimatedLoading(message: 'Loading saved bookmarks...'),
        error: (err, _) => Center(child: Text('Error loading bookmarks: $err')),
        data: (questions) {
          if (questions.isEmpty) {
            return NecAnimatedEmptyState(
              title: 'No Saved Questions Yet',
              subtitle: 'Tap the bookmark ribbon icon during practice quizzes or mock exams to save challenging questions here for fast review.',
              buttonText: 'Start Practice Quiz',
              onButtonPressed: () {
                Navigator.pop(context);
                ref.read(selectedTabProvider.notifier).state = 3;
              },
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: questions.length,
            itemBuilder: (context, idx) {
              final item = questions[idx];
              final q = item.question;
              final correctOpt = item.options.firstWhere(
                (o) => o.isCorrect,
                orElse: () => item.options.first,
              );

              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? AppTheme.darkCard : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade200,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryTeal.withAlpha(25),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            q.unitId.toUpperCase().replaceAll('_', ' '),
                            style: const TextStyle(
                              color: AppTheme.primaryTeal,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.bookmark_remove, color: AppTheme.errorRed, size: 20),
                          tooltip: 'Remove from Bookmarks',
                          onPressed: () {
                            ref.read(bookmarksProvider.notifier).toggleBookmark(q.id);
                            ref.invalidate(bookmarkedQuestionsFutureProvider);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      q.questionText,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, height: 1.4),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.successGreen.withAlpha(20),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.successGreen.withAlpha(60)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle, color: AppTheme.successGreen, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Correct Answer (${correctOpt.optionLetter}): ${correctOpt.textContent}',
                              style: const TextStyle(
                                color: AppTheme.successGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (q.explanation.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Text(
                        'Explanation: ${q.explanation}',
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ],
                ),
              ).staggeredEntrance(context: context, index: idx);
            },
          );
        },
      ),
    );
  }
}
