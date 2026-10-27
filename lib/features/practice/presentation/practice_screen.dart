import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../../core/animations/nec_animations.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/providers/bookmarks_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/nec_animated_empty_state.dart';
import '../../../core/widgets/nec_animated_loading.dart';
import '../../../core/widgets/necx_app_bar.dart';
import 'practice_controller.dart';

class PracticeScreen extends ConsumerStatefulWidget {
  final String? initialUnitId;
  final String? unitTitle;

  const PracticeScreen({super.key, this.initialUnitId, this.unitTitle});

  @override
  ConsumerState<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends ConsumerState<PracticeScreen> {
  String _selectedUnitId = 'unit_1';
  int _questionCount = 10;
  bool _immediateFeedback = true;
  bool _quizStarted = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialUnitId != null) {
      _selectedUnitId = widget.initialUnitId!;
    }
  }

  void _startQuiz() {
    ref.read(practiceQuizProvider).loadQuiz(
          unitId: _selectedUnitId,
          count: _questionCount,
          immediateFeedback: _immediateFeedback,
        );
    setState(() => _quizStarted = true);
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(practiceQuizProvider).state;
    final unitsAsync = ref.watch(unitsStreamProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (!_quizStarted) {
      return Scaffold(
        appBar: NecAppBar(
          title: widget.unitTitle ?? 'Practice Quiz Setup',
          showBackButton: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Repetition Banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.primaryTeal.withAlpha(25),
                      AppTheme.primaryTeal.withAlpha(10),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.primaryTeal.withAlpha(50)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryTeal.withAlpha(30),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.psychology, color: AppTheme.primaryTeal, size: 26),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Smart Question Engine (10,000+ Bank)',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Unseen questions are prioritized first, followed by least-recently-seen items.',
                            style: TextStyle(fontSize: 11, color: isDark ? Colors.grey.shade400 : Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Text('Select Chapter / Unit', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              unitsAsync.when(
                data: (units) => DropdownButtonFormField<String>(
                  initialValue: _selectedUnitId,
                  isExpanded: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: isDark ? const Color(0xFF161F30) : Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade300),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  items: units.map((u) {
                    return DropdownMenuItem(
                      value: u.id,
                      child: Text(
                        'Unit ${u.unitNumber}: ${u.title}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 13),
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedUnitId = val);
                  },
                ),
                loading: () => const LinearProgressIndicator(),
                error: (e, _) => Text('Error: $e'),
              ),

              const SizedBox(height: 24),

              Text('Question Count', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              // FIXED: Replaced rigid Row with Wrap to completely eliminate "Right overflowed by 26 pixel"
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [5, 10, 15, 25].map((count) {
                  final isSel = _questionCount == count;
                  return ChoiceChip(
                    selected: isSel,
                    selectedColor: AppTheme.primaryTeal,
                    backgroundColor: isDark ? const Color(0xFF161F30) : Colors.grey.shade200,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    label: Text(
                      '$count Questions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: isSel ? Colors.black87 : (isDark ? Colors.white70 : Colors.black87),
                      ),
                    ),
                    onSelected: (_) => setState(() => _questionCount = count),
                  );
                }).toList(),
              ),

              const SizedBox(height: 24),

              Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF161F30) : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade200),
                ),
                child: SwitchListTile(
                  activeThumbColor: AppTheme.primaryTeal,
                  title: const Text('Immediate Feedback Mode', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  subtitle: const Text('Show correct answers & detailed explanations right after selecting each option', style: TextStyle(fontSize: 12)),
                  value: _immediateFeedback,
                  onChanged: (val) => setState(() => _immediateFeedback = val),
                ),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryTeal,
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: _startQuiz,
                  icon: const Icon(Icons.play_arrow_rounded, size: 24),
                  label: const Text('Start Practice Quiz', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),

              const SizedBox(height: 16),

              Center(
                child: TextButton.icon(
                  icon: const Icon(Icons.restart_alt, size: 18, color: Colors.grey),
                  label: const Text('Reset Question Pool for this Unit', style: TextStyle(color: Colors.grey)),
                  onPressed: () async {
                    await ref.read(practiceQuizProvider).resetPool(_selectedUnitId);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Question pool reset! All questions marked as unseen.')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (quizState.isLoading) {
      return const Scaffold(
        body: Center(
          child: NecAnimatedLoading(message: 'Generating practice questions...'),
        ),
      );
    }

    if (quizState.isCompleted) {
      return _buildCompletionScreen(context, quizState);
    }

    final currentQ = quizState.currentQuestion;
    if (currentQ == null) {
      return Scaffold(
        appBar: const NecAppBar(title: 'Practice Quiz', showBackButton: true),
        body: Center(
          child: NecAnimatedEmptyState(
            title: 'No Questions Found',
            subtitle: 'No questions available in this pool.',
            ctaText: 'Go Back',
            onCtaPressed: () => setState(() => _quizStarted = false),
          ),
        ),
      );
    }

    final selectedOptId = quizState.selectedAnswers[currentQ.id];
    final isAnswered = selectedOptId != null;
    final isBookmarked = ref.watch(bookmarksProvider).contains(currentQ.id);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => setState(() => _quizStarted = false),
        ),
        title: Text(
          'Question ${quizState.currentIndex + 1} of ${quizState.questions.length}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          // Bookmark Question Button
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? const Color(0xFFEC4899) : (isDark ? Colors.white70 : Colors.black87),
            ),
            tooltip: 'Save Question',
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
          TextButton(
            onPressed: () => setState(() => _quizStarted = false),
            child: const Text('Exit', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Smooth Progress Bar
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: (quizState.currentIndex + 1) / quizState.questions.length,
                minHeight: 6,
                backgroundColor: isDark ? const Color(0xFF222F46) : Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation(AppTheme.primaryTeal),
              ),
            ),
            const SizedBox(height: 16),

            // Question Tags using Wrap (Zero Horizontal Overflow)
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryTeal.withAlpha(25),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    currentQ.unitId.toUpperCase().replaceAll('_', ' '),
                    style: const TextStyle(color: AppTheme.primaryTeal, fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                ),
                if (currentQ.isPyq && currentQ.year != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppTheme.accentAmber.withAlpha(25),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'PYQ ${currentQ.year} BS',
                      style: const TextStyle(color: AppTheme.accentAmber, fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(30),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    currentQ.difficulty.toUpperCase(),
                    style: TextStyle(
                      color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Question Text
            Text(
              currentQ.text,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 20),

            // 4 Options (Completely responsive with Expanded text and tactile feedback)
            ...currentQ.options.map((opt) {
              final isThisSelected = selectedOptId == opt.id;
              Color? borderColor;
              Color? bgColor;

              if (isAnswered && quizState.immediateFeedback) {
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
                child: NecPressable(
                  onTap: isAnswered
                      ? null
                      : () => ref.read(practiceQuizProvider).answerQuestion(currentQ.id, opt.id),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                      color: bgColor ?? (isDark ? const Color(0xFF161F30) : Colors.white),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: borderColor ?? (isDark ? AppTheme.darkCardBorder : Colors.grey.shade300),
                        width: isThisSelected || (isAnswered && opt.isCorrect) ? 2 : 1,
                      ),
                      boxShadow: isThisSelected
                          ? [
                              BoxShadow(
                                color: (borderColor ?? AppTheme.primaryTeal).withAlpha(35),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              )
                            ]
                          : null,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: borderColor?.withAlpha(40) ?? (isDark ? const Color(0xFF222F46) : Colors.grey.withAlpha(30)),
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
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            opt.textContent,
                            style: const TextStyle(fontSize: 14, height: 1.3),
                          ),
                        ),
                        if (isAnswered && quizState.immediateFeedback) ...[
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

            // Official Explanation Box
            if (isAnswered && quizState.immediateFeedback && currentQ.explanation.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF0F2536) : const Color(0xFFE6FFFA),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppTheme.primaryTeal.withAlpha(70)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.lightbulb_rounded, color: AppTheme.primaryTeal, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Official NEC Explanation',
                          style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryTeal, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      currentQ.explanation,
                      style: TextStyle(fontSize: 13, height: 1.4, color: isDark ? Colors.grey.shade300 : Colors.black87),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 28),

            // Navigation Controls (Flexible & Responsive)
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: quizState.currentIndex > 0
                        ? () => ref.read(practiceQuizProvider).previousQuestion()
                        : null,
                    child: const Text('Previous'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryTeal,
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: isAnswered
                        ? () => ref.read(practiceQuizProvider).nextQuestion()
                        : null,
                    child: Text(
                      quizState.currentIndex == quizState.questions.length - 1 ? 'Finish Quiz' : 'Next Question',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletionScreen(BuildContext context, PracticeQuizState state) {
    final score = state.score;
    final total = state.questions.length;
    final pct = total > 0 ? (score / total) * 100 : 0.0;
    final passed = pct >= 50.0;

    return Scaffold(
      appBar: const NecAppBar(title: 'Quiz Summary', showBackButton: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 140,
                height: 140,
                child: Lottie.asset(
                  'assets/lottie/success.json',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: (passed ? AppTheme.successGreen : AppTheme.accentAmber).withAlpha(30),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      passed ? Icons.verified_rounded : Icons.stars_rounded,
                      size: 48,
                      color: passed ? AppTheme.successGreen : AppTheme.accentAmber,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                passed ? 'Great Job!' : 'Keep Practicing!',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Score: $score / $total (${pct.toInt()}%)',
                style: const TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              const Text(
                'Your answers have been saved to update your Exam Readiness score and spaced repetition schedule.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 28),
              NecPressable(
                onTap: () => setState(() => _quizStarted = false),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryTeal,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryTeal.withAlpha(50),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Practice Another Topic',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
