import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/providers/bookmarks_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../practice/domain/question_models.dart';

class PyqPracticeScreen extends ConsumerStatefulWidget {
  final String title;
  final String subtitle;
  final List<QuestionWithOptions> questions;

  const PyqPracticeScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.questions,
  });

  @override
  ConsumerState<PyqPracticeScreen> createState() => _PyqPracticeScreenState();
}

class _PyqPracticeScreenState extends ConsumerState<PyqPracticeScreen> {
  int _currentIndex = 0;
  final Map<String, String> _selectedAnswers = {};
  bool _isFinished = false;

  QuestionWithOptions? get _currentQuestion =>
      widget.questions.isNotEmpty && _currentIndex < widget.questions.length
          ? widget.questions[_currentIndex]
          : null;

  int get _score {
    int s = 0;
    for (final q in widget.questions) {
      if (_selectedAnswers[q.id] == q.correctOption?.id) {
        s++;
      }
    }
    return s;
  }

  void _onOptionSelected(String questionId, String optionId) {
    if (_selectedAnswers.containsKey(questionId)) return; // Already answered

    setState(() {
      _selectedAnswers[questionId] = optionId;
    });

    final currentQ = _currentQuestion;
    final isCorrect = currentQ?.correctOption?.id == optionId;
    final userId = ref.read(currentUserIdProvider);

    // Persist answer asynchronously
    ref.read(repositoryProvider).logAnswer(
          userId: userId,
          questionId: questionId,
          selectedOptionId: optionId,
          isCorrect: isCorrect,
          mode: 'pyq',
          unitId: currentQ?.unitId ?? 'unit_1',
        );
  }

  void _jumpToQuestion(int index) {
    if (index >= 0 && index < widget.questions.length) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _showPalette(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          maxChildSize: 0.85,
          minChildSize: 0.35,
          expand: false,
          builder: (_, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Question Palette (${widget.questions.length} Qs)',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        '${_selectedAnswers.length} of ${widget.questions.length} Attempted',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      controller: scrollController,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.1,
                      ),
                      itemCount: widget.questions.length,
                      itemBuilder: (context, index) {
                        final q = widget.questions[index];
                        final isAnswered = _selectedAnswers.containsKey(q.id);
                        final isCurrent = _currentIndex == index;
                        final isCorrect = isAnswered && _selectedAnswers[q.id] == q.correctOption?.id;

                        Color bgColor;
                        Color textColor;

                        if (isCurrent) {
                          bgColor = AppTheme.primaryTeal;
                          textColor = Colors.white;
                        } else if (isAnswered) {
                          bgColor = isCorrect
                              ? AppTheme.successGreen.withAlpha(40)
                              : AppTheme.errorRed.withAlpha(40);
                          textColor = isCorrect ? AppTheme.successGreen : AppTheme.errorRed;
                        } else {
                          bgColor = isDark ? const Color(0xFF1E293B) : Colors.grey.shade100;
                          textColor = isDark ? Colors.grey.shade300 : Colors.grey.shade700;
                        }

                        return InkWell(
                          onTap: () {
                            _jumpToQuestion(index);
                            Navigator.pop(ctx);
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isCurrent ? AppTheme.primaryTeal : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: textColor,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (widget.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.inbox_outlined, size: 48, color: Colors.grey),
              const SizedBox(height: 12),
              const Text('No questions found in this set.', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back to Sets'),
              ),
            ],
          ),
        ),
      );
    }

    if (_isFinished) {
      return _buildSummaryScreen(context);
    }

    final currentQ = _currentQuestion!;
    final selectedOptId = _selectedAnswers[currentQ.id];
    final isAnswered = selectedOptId != null;
    final isBookmarked = ref.watch(bookmarksProvider).contains(currentQ.id);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(
              'Question ${_currentIndex + 1} of ${widget.questions.length}',
              style: TextStyle(fontSize: 11, color: isDark ? Colors.grey.shade400 : Colors.grey.shade600),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? const Color(0xFFEC4899) : null,
            ),
            tooltip: 'Bookmark',
            onPressed: () {
              ref.read(bookmarksProvider.notifier).toggleBookmark(currentQ.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isBookmarked ? 'Removed from Bookmarks' : 'Saved to Bookmarks!'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.grid_view_rounded),
            tooltip: 'Question Palette',
            onPressed: () => _showPalette(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Smooth Linear Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: (_currentIndex + 1) / widget.questions.length,
                minHeight: 6,
                backgroundColor: isDark ? const Color(0xFF222F46) : Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation(AppTheme.primaryTeal),
              ),
            ),
            const SizedBox(height: 16),

            // Metadata Chips
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryTeal.withAlpha(25),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    currentQ.unitId.toUpperCase().replaceAll('_', ' '),
                    style: const TextStyle(
                      color: AppTheme.primaryTeal,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
                if (currentQ.isPyq && currentQ.year != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.accentAmber.withAlpha(30),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'PYQ ${currentQ.year} BS',
                      style: const TextStyle(
                        color: AppTheme.accentAmber,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(30),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    currentQ.difficulty.toUpperCase(),
                    style: TextStyle(
                      color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Question Text
            Text(
              currentQ.text,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 20),

            // Options List
            ...currentQ.options.map((opt) {
              final isThisSelected = selectedOptId == opt.id;
              Color? borderColor;
              Color? bgColor;

              if (isAnswered) {
                if (opt.isCorrect) {
                  borderColor = AppTheme.successGreen;
                  bgColor = AppTheme.successGreen.withAlpha(25);
                } else if (isThisSelected) {
                  borderColor = AppTheme.errorRed;
                  bgColor = AppTheme.errorRed.withAlpha(25);
                }
              } else if (isThisSelected) {
                borderColor = AppTheme.primaryTeal;
                bgColor = AppTheme.primaryTeal.withAlpha(20);
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  onTap: isAnswered ? null : () => _onOptionSelected(currentQ.id, opt.id),
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                      color: bgColor ?? (isDark ? const Color(0xFF161F30) : Colors.white),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: borderColor ?? (isDark ? AppTheme.darkCardBorder : Colors.grey.shade300),
                        width: isThisSelected || (isAnswered && opt.isCorrect) ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: borderColor?.withAlpha(40) ??
                                (isDark ? const Color(0xFF222F46) : Colors.grey.withAlpha(30)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            opt.optionLetter,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: borderColor ?? (isDark ? Colors.white : Colors.black87),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            opt.textContent,
                            style: const TextStyle(fontSize: 14, height: 1.3),
                          ),
                        ),
                        if (isAnswered) ...[
                          const SizedBox(width: 8),
                          if (opt.isCorrect)
                            const Icon(Icons.check_circle, color: AppTheme.successGreen, size: 22)
                          else if (isThisSelected)
                            const Icon(Icons.cancel, color: AppTheme.errorRed, size: 22),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }),

            // Official Explanation Box (Single source of truth from NEC GitBook)
            if (isAnswered && currentQ.explanation.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryTeal.withAlpha(20),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppTheme.primaryTeal.withAlpha(70)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.lightbulb, color: AppTheme.primaryTeal, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Official NEC Explanation',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryTeal,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      currentQ.explanation,
                      style: TextStyle(
                        fontSize: 13.5,
                        height: 1.45,
                        color: isDark ? Colors.grey.shade200 : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),

            // Next / Previous Navigation Bar
            Row(
              children: [
                if (_currentIndex > 0)
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.chevron_left, size: 20),
                      label: const Text('Previous'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () => _jumpToQuestion(_currentIndex - 1),
                    ),
                  ),
                if (_currentIndex > 0) const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    icon: Icon(
                      _currentIndex < widget.questions.length - 1
                          ? Icons.chevron_right
                          : Icons.check_circle_outline,
                      size: 20,
                    ),
                    label: Text(
                      _currentIndex < widget.questions.length - 1
                          ? 'Next Question'
                          : 'View Score Summary',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryTeal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      if (_currentIndex < widget.questions.length - 1) {
                        _jumpToQuestion(_currentIndex + 1);
                      } else {
                        setState(() {
                          _isFinished = true;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryScreen(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final total = widget.questions.length;
    final score = _score;
    final pct = total > 0 ? (score / total) * 100 : 0.0;
    final passed = pct >= 50.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PYQ Practice Summary'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: passed ? AppTheme.successGreen.withAlpha(25) : AppTheme.errorRed.withAlpha(25),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: passed ? AppTheme.successGreen : AppTheme.errorRed,
                  width: 1.5,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    passed ? Icons.check_circle_rounded : Icons.info_outline_rounded,
                    size: 58,
                    color: passed ? AppTheme.successGreen : AppTheme.errorRed,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    passed ? 'SET COMPLETED - QUALIFIED!' : 'SET COMPLETED - KEEP REVISING',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: passed ? AppTheme.successGreen : AppTheme.errorRed,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '$score / $total (${pct.toStringAsFixed(1)}%)',
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Nepal Engineering Council Standard: 50% Pass Mark',
                    style: TextStyle(fontSize: 12, color: isDark ? Colors.grey.shade400 : Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.replay),
                    label: const Text('Retry Set'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedAnswers.clear();
                        _currentIndex = 0;
                        _isFinished = false;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.list_alt),
                    label: const Text('Back to PYQs'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryTeal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
