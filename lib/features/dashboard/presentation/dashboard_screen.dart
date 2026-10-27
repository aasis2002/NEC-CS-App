import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/animations/nec_animations.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/necx_app_bar.dart';
import '../../../core/widgets/necx_drawer.dart';
import '../../../core/widgets/app_footer.dart';
import '../../../core/services/question_generator_service.dart';
import '../../notes/presentation/syllabus_modal.dart';
import '../../practice/presentation/bookmarks_screen.dart';
import '../../practice/presentation/model_sets_screen.dart';
import '../../exam/presentation/exam_simulator_screen.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readinessAsync = ref.watch(readinessScoreStreamProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: const NecAppBar(),
      drawer: const NecDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(repositoryProvider).recomputeReadinessScore('local_guest_user');
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Study Materials Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Study Materials',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.2,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryTeal.withAlpha(isDark ? 30 : 20),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        '10 Units ACtE',
                        style: TextStyle(
                          color: AppTheme.primaryTeal,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ).staggeredEntrance(context: context, index: 0),
              const SizedBox(height: 4),

              // 2x2 Grid for Quizzes, Syllabus, Notes, Past Papers
              Row(
                children: [
                  Expanded(
                    child: _buildStudyTile(
                      isDark: isDark,
                      icon: Icons.quiz_outlined,
                      iconColor: const Color(0xFFA855F7),
                      iconBg: const Color(0xFF3B1E54),
                      title: 'Quizzes',
                      subtitle: '1000+ MCQs',
                      onTap: () => ref.read(selectedTabProvider.notifier).state = 3, // Quizzes tab
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStudyTile(
                      isDark: isDark,
                      icon: Icons.assignment_outlined,
                      iconColor: const Color(0xFF3B82F6),
                      iconBg: const Color(0xFF1E2E54),
                      title: 'Syllabus',
                      subtitle: 'Official Topics',
                      onTap: () => showSyllabusModal(context),
                    ),
                  ),
                ],
              ).staggeredEntrance(context: context, index: 1),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildStudyTile(
                      isDark: isDark,
                      icon: Icons.menu_book_rounded,
                      iconColor: const Color(0xFF10B981),
                      iconBg: const Color(0xFF153E35),
                      title: 'Notes',
                      subtitle: 'Chapter PDFs',
                      onTap: () => ref.read(selectedTabProvider.notifier).state = 1, // Notes tab
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStudyTile(
                      isDark: isDark,
                      icon: Icons.description_outlined,
                      iconColor: const Color(0xFF00BFA5),
                      iconBg: const Color(0xFF0F3635),
                      title: 'Past Papers',
                      subtitle: 'Solved Sets',
                      onTap: () => ref.read(selectedTabProvider.notifier).state = 2, // Papers tab
                    ),
                  ),
                ],
              ).staggeredEntrance(context: context, index: 2),
              const SizedBox(height: 12),

              // Full-Width Bookmarks Card
              NecPressable(
                onTap: () {
                  Navigator.push(
                    context,
                    NecAnimations.sharedAxisRoute(page: const BookmarksScreen()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF161F30) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade200,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4A152E),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.bookmark_rounded,
                            color: Color(0xFFEC4899),
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bookmarks',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Saved Questions & Flagged Notes',
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ).staggeredEntrance(context: context, index: 3),

              const SizedBox(height: 24),

              // 2. Mock Exam Section (Screenshot 4)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  'Mock Exam',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Blue Hero Mock Exam Card with Subtle Pulse & Tactile Action
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1A4480), Color(0xFF132A54)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF3B82F6).withAlpha(80)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1D4ED8).withAlpha(35),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2563EB).withAlpha(50),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.school_rounded, color: Color(0xFF60A5FA), size: 26),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Attempt Exam Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Real exam format with results & insights',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // 3 Columns: 100 Questions | 2 hrs Duration | 100 Marks
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(40),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatColumn('100', 'Questions'),
                          Container(width: 1, height: 28, color: Colors.white12),
                          _buildStatColumn('2 hrs', 'Duration'),
                          Container(width: 1, height: 28, color: Colors.white12),
                          _buildStatColumn('100', 'Marks'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Note with Checkmark
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(10),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.check, size: 16, color: Color(0xFF60A5FA)),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Same pattern, syllabus & timing as the real NEC exam (100 MCQs)',
                              style: TextStyle(color: Colors.white70, fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Start -> White Pill Button with Spring Press
                    NecPressable(
                      onTap: () {
                        Navigator.push(
                          context,
                          NecAnimations.sharedAxisRoute(
                            page: ExamSimulatorScreen(
                              preloadedQuestions: QuestionGeneratorService.generateModelSet(
                                setNumber: 1,
                                count: 100,
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(30),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start Full 100-Question Exam',
                              style: TextStyle(
                                color: Color(0xFF132A54),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.arrow_forward_rounded, color: Color(0xFF132A54), size: 18),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ).staggeredEntrance(context: context, index: 4),

              const SizedBox(height: 24),

              // 3. Practice Model Sets Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Practice Model Sets',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.2,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        NecAnimations.sharedAxisRoute(page: const ModelSetsScreen()),
                      );
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('View All 29', style: TextStyle(color: Color(0xFF00BFA5), fontWeight: FontWeight.bold, fontSize: 13)),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward_rounded, color: Color(0xFF00BFA5), size: 16),
                      ],
                    ),
                  ),
                ],
              ).staggeredEntrance(context: context, index: 5),
              const SizedBox(height: 8),

              // Practice Model Sets Banner Tile
              NecPressable(
                onTap: () {
                  Navigator.push(
                    context,
                    NecAnimations.sharedAxisRoute(page: const ModelSetsScreen()),
                  );
                },
                child: Material(
                  color: isDark ? const Color(0xFF161F30) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade200,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(Icons.timer_outlined, color: Colors.white, size: 24),
                      ),
                      title: const Text('Simulated Model Practice', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      subtitle: const Text('29 full-length sets • 10,000+ Permutated MCQs', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      trailing: const Icon(Icons.chevron_right, color: Color(0xFF00BFA5)),
                    ),
                  ),
                ),
              ).staggeredEntrance(context: context, index: 6),

              const SizedBox(height: 24),

              // 4. Exam Readiness Score Widget with Fluid TweenAnimationBuilder
              readinessAsync.when(
                data: (breakdown) => Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF161F30) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.0, end: breakdown.overallScore.clamp(0.0, 100.0)),
                        duration: const Duration(milliseconds: 1100),
                        curve: Curves.easeOutCubic,
                        builder: (context, val, _) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 56,
                                height: 56,
                                child: CircularProgressIndicator(
                                  value: val / 100.0,
                                  strokeWidth: 4.5,
                                  backgroundColor: isDark ? const Color(0xFF1E2E44) : Colors.grey.shade200,
                                  valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryTeal),
                                ),
                              ),
                              Text(
                                '${val.toInt()}%',
                                style: const TextStyle(
                                  color: AppTheme.primaryTeal,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Licensing Exam Readiness',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'Notes: ${breakdown.notesProgressPct.toInt()}% • Quizzes: ${breakdown.quizAccuracyPct.toInt()}% • Past Papers: ${breakdown.pyqAccuracyPct.toInt()}%',
                              style: TextStyle(fontSize: 11, color: isDark ? Colors.grey.shade400 : Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).staggeredEntrance(context: context, index: 7),
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),

              const SizedBox(height: 24),
              const AppFooter(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStudyTile({
    required bool isDark,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return NecPressable(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF161F30) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade200,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(color: isDark ? Colors.grey.shade400 : Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String val, String label) {
    return Column(
      children: [
        Text(
          val,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(color: Colors.white60, fontSize: 11),
        ),
      ],
    );
  }
}
