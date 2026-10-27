import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/animations/nec_animations.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/necx_app_bar.dart';
import '../../../core/widgets/necx_drawer.dart';
import '../../../core/widgets/app_footer.dart';
import 'practice_screen.dart';

class QuizzesListScreen extends ConsumerWidget {
  const QuizzesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final subjectMeta = [
      {'code': '01', 'title': 'Artificial Intelligence and Neural Networks', 'unitId': 'unit_9', 'sets': 10, 'qs': 50},
      {'code': '02', 'title': 'Basic Electrical and Electronics Engineering', 'unitId': 'unit_1', 'sets': 10, 'qs': 50},
      {'code': '03', 'title': 'Computer Network and Network Security', 'unitId': 'unit_5', 'sets': 10, 'qs': 50},
      {'code': '04', 'title': 'Computer Organization and Embedded System', 'unitId': 'unit_4', 'sets': 10, 'qs': 50},
      {'code': '05', 'title': 'Data Structures, DBMS, OS', 'unitId': 'unit_7', 'sets': 10, 'qs': 50},
      {'code': '06', 'title': 'Digital Logic and Microprocessor', 'unitId': 'unit_2', 'sets': 10, 'qs': 50},
      {'code': '07', 'title': 'Programming Language and Its Applications', 'unitId': 'unit_3', 'sets': 10, 'qs': 50},
      {'code': '08', 'title': 'Software Engineering and Object Oriented Analysis', 'unitId': 'unit_8', 'sets': 10, 'qs': 50},
      {'code': '09', 'title': 'Theory of Computation and Computer Graphics', 'unitId': 'unit_6', 'sets': 10, 'qs': 50},
      {'code': '10', 'title': 'Engineering Economics and NEC Regulations', 'unitId': 'unit_10', 'sets': 10, 'qs': 50},
    ];

    return Scaffold(
      appBar: const NecAppBar(),
      drawer: const NecDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Header matching Screenshot 2
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'All Subjects',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.2,
                ),
              ),
            ),
            const SizedBox(height: 4),

            // Subject Cards List with Staggered Entrance Animations
            ...subjectMeta.asMap().entries.map((entry) {
              final idx = entry.key;
              final sub = entry.value;

              void openPractice() {
                Navigator.push(
                  context,
                  NecAnimations.sharedAxisRoute(
                    page: PracticeScreen(
                      initialUnitId: sub['unitId'] as String,
                      unitTitle: sub['title'] as String,
                    ),
                  ),
                );
              }

              return NecPressable(
                onTap: openPractice,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF161F30) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade200,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(isDark ? 30 : 8),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Left Teal Squircle Badge with two-digit index (01, 02...)
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF00BFA5), Color(0xFF00897B)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF00BFA5).withAlpha(40),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              sub['code'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          // Center Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sub['title'] as String,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    height: 1.25,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${sub['sets']} Sets • ${sub['qs']} Questions',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Right Circular Teal Arrow Button
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: const Color(0xFF00BFA5).withAlpha(25),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_rounded,
                              color: Color(0xFF00BFA5),
                              size: 20,
                            ),
                          ),
                        ],
                      ),

                    const SizedBox(height: 14),

                    // Bottom Row: "Not Attempted" status pill & "0%" Progress
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: isDark ? const Color(0xFF222F46) : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Not Attempted',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '0%',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Horizontal Progress Bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0.0,
                        minHeight: 4,
                        backgroundColor: isDark ? const Color(0xFF222F46) : Colors.grey.shade200,
                        valueColor: const AlwaysStoppedAnimation(Color(0xFF00BFA5)),
                      ),
                    ),
                  ],
                ),
              ),
            ).staggeredEntrance(context: context, index: idx);
          }),
            const SizedBox(height: 12),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
