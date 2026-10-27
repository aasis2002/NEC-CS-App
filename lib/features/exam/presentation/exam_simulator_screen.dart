import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/animations/nec_animations.dart';
import '../../../core/widgets/nec_animated_loading.dart';
import '../../../core/theme/app_theme.dart';
import '../../practice/domain/question_models.dart';
import 'exam_simulator_controller.dart';
import 'exam_results_screen.dart';

class ExamSimulatorScreen extends ConsumerStatefulWidget {
  final List<QuestionWithOptions>? preloadedQuestions;

  const ExamSimulatorScreen({super.key, this.preloadedQuestions});

  @override
  ConsumerState<ExamSimulatorScreen> createState() => _ExamSimulatorScreenState();
}

class _ExamSimulatorScreenState extends ConsumerState<ExamSimulatorScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(examSimulatorProvider).initializeExam(preloadedQuestions: widget.preloadedQuestions);
    });
  }

  void _showQuestionPalette(BuildContext context) {
    final state = ref.read(examSimulatorProvider).state;
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
          minChildSize: 0.4,
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
                      const Text(
                        'Question Palette (100 MCQs)',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        '${state.answeredCount} Answered • ${state.flaggedCount} Flagged',
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
                      itemCount: state.questions.length,
                      itemBuilder: (context, index) {
                        final q = state.questions[index];
                        final isAnswered = state.selectedAnswers.containsKey(q.id);
                        final isFlagged = state.flaggedQuestionIds.contains(q.id);
                        final isCurrent = state.currentIndex == index;

                        Color bgColor;
                        Color textColor = Colors.black87;

                        if (isCurrent) {
                          bgColor = AppTheme.primaryBlue;
                          textColor = Colors.white;
                        } else if (isFlagged) {
                          bgColor = AppTheme.accentAmber.withAlpha(50);
                          textColor = AppTheme.accentAmber;
                        } else if (isAnswered) {
                          bgColor = AppTheme.successGreen.withAlpha(40);
                          textColor = isDark ? Colors.white : AppTheme.successGreen;
                        } else {
                          bgColor = isDark ? const Color(0xFF1E293B) : Colors.grey.shade100;
                          textColor = isDark ? Colors.grey.shade300 : Colors.grey.shade700;
                        }

                        return InkWell(
                          onTap: () {
                            ref.read(examSimulatorProvider).jumpToQuestion(index);
                            Navigator.pop(ctx);
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isCurrent
                                    ? AppTheme.primaryBlue
                                    : (isFlagged ? AppTheme.accentAmber : Colors.transparent),
                                width: 1.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                    fontSize: 13,
                                  ),
                                ),
                                if (isFlagged)
                                  const Positioned(
                                    top: 4,
                                    right: 4,
                                    child: Icon(Icons.flag, size: 10, color: AppTheme.accentAmber),
                                  ),
                              ],
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

  void _confirmSubmit(BuildContext context) {
    final state = ref.read(examSimulatorProvider).state;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Submit Exam?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Answered: ${state.answeredCount} / ${state.questions.length}'),
            const SizedBox(height: 4),
            Text(
              'Unanswered: ${state.remainingCount}',
              style: TextStyle(
                color: state.remainingCount > 0 ? AppTheme.errorRed : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (state.flaggedCount > 0) ...[
              const SizedBox(height: 4),
              Text(
                'Flagged for review: ${state.flaggedCount}',
                style: const TextStyle(color: AppTheme.accentAmber, fontWeight: FontWeight.bold),
              ),
            ],
            const SizedBox(height: 12),
            const Text(
              'Pass mark is 50% (50/100). Are you ready to submit?',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              ref.read(examSimulatorProvider).submitExam();
            },
            child: const Text('Submit Now'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(examSimulatorProvider).state;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // If submitted, show full results screen
    if (state.isSubmitted && state.completedAttempt != null) {
      return ExamResultsScreen(
        attempt: state.completedAttempt!,
        questions: state.questions,
        userAnswers: state.selectedAnswers,
        perUnitScore: state.perUnitScore,
        perUnitTotal: state.perUnitTotal,
      );
    }

    if (state.isLoading) {
      return const Scaffold(
        body: Center(
          child: NecAnimatedLoading(
            message: 'Assembling 100-MCQ Exam from 10 Syllabus Units...',
          ),
        ),
      );
    }

    final currentQ = state.currentQuestion;
    if (currentQ == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Simulator Error')),
        body: const Center(child: Text('Unable to load questions for exam simulator.')),
      );
    }

    final isFlagged = state.flaggedQuestionIds.contains(currentQ.id);
    final selectedOptId = state.selectedAnswers[currentQ.id];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Question ${state.currentIndex + 1} of ${state.questions.length}', style: const TextStyle(fontSize: 15)),
            Text(
              currentQ.unitId.toUpperCase().replaceAll('_', ' '),
              style: TextStyle(fontSize: 11, color: isDark ? Colors.grey.shade400 : Colors.grey.shade600),
            ),
          ],
        ),
        actions: [
          // Countdown Timer Pill with gentle pulsing when < 10 mins
          Builder(
            builder: (ctx) {
              final isCritical = state.remainingSeconds < 600;
              final timerWidget = Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: state.remainingSeconds < 300
                      ? AppTheme.errorRed.withAlpha(25)
                      : (isCritical ? AppTheme.accentAmber.withAlpha(25) : AppTheme.primaryBlue.withAlpha(25)),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: state.remainingSeconds < 300
                        ? AppTheme.errorRed.withAlpha(80)
                        : (isCritical ? AppTheme.accentAmber.withAlpha(80) : Colors.transparent),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      size: 16,
                      color: state.remainingSeconds < 300
                          ? AppTheme.errorRed
                          : (isCritical ? AppTheme.accentAmber : AppTheme.primaryBlue),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      state.formattedTimer,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: state.remainingSeconds < 300
                            ? AppTheme.errorRed
                            : (isCritical ? AppTheme.accentAmber : AppTheme.primaryBlue),
                      ),
                    ),
                  ],
                ),
              );

              return isCritical ? timerWidget.subtlePulse(context: ctx) : timerWidget;
            },
          ),
          const SizedBox(width: 6),
          IconButton(
            icon: const Icon(Icons.grid_view_rounded),
            tooltip: 'Question Palette',
            onPressed: () => _showQuestionPalette(context),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkSurface : Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.withAlpha(40))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: state.currentIndex > 0
                    ? () => ref.read(examSimulatorProvider).previousQuestion()
                    : null,
                child: const Text('Previous'),
              ),
              OutlinedButton.icon(
                icon: Icon(
                  isFlagged ? Icons.flag : Icons.outlined_flag,
                  color: isFlagged ? AppTheme.accentAmber : null,
                  size: 18,
                ),
                label: Text(isFlagged ? 'Flagged' : 'Flag'),
                onPressed: () => ref.read(examSimulatorProvider).toggleFlag(currentQ.id),
              ),
              if (state.currentIndex == state.questions.length - 1)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.successGreen),
                  onPressed: () => _confirmSubmit(context),
                  child: const Text('Submit Exam'),
                )
              else
                ElevatedButton(
                  onPressed: () => ref.read(examSimulatorProvider).nextQuestion(),
                  child: const Text('Next'),
                ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress tracker with smooth animation
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(
                  begin: 0.0,
                  end: (state.currentIndex + 1) / state.questions.length,
                ),
                duration: const Duration(milliseconds: 250),
                builder: (context, value, _) {
                  return LinearProgressIndicator(
                    value: value,
                    minHeight: 5,
                    backgroundColor: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                    valueColor: const AlwaysStoppedAnimation(AppTheme.primaryBlue),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Question Text
            Text(
              currentQ.text,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),

            // Exactly 4 Options with spring scale tactile feedback
            ...currentQ.options.map((opt) {
              final isSelected = selectedOptId == opt.id;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: NecPressable(
                  onTap: () => ref.read(examSimulatorProvider).selectAnswer(currentQ.id, opt.id),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.primaryBlue.withAlpha(25)
                          : (isDark ? const Color(0xFF1E293B) : Colors.white),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? AppTheme.primaryBlue
                            : (isDark ? const Color(0xFF334155) : Colors.grey.shade300),
                        width: isSelected ? 2 : 1,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppTheme.primaryBlue.withAlpha(40),
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
                            color: isSelected ? AppTheme.primaryBlue : Colors.grey.withAlpha(30),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            opt.optionLetter,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : (isDark ? Colors.white : Colors.black87),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            opt.textContent,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                        if (isSelected)
                          const Icon(Icons.check_circle, color: AppTheme.primaryBlue, size: 20),
                      ],
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),

            Center(
              child: TextButton.icon(
                icon: const Icon(Icons.check_box_outlined, size: 18),
                label: const Text('Review and Submit Exam Early'),
                onPressed: () => _confirmSubmit(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
