import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/animations/nec_animations.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_theme.dart';
import '../../dashboard/presentation/dashboard_screen.dart';
import '../../notes/presentation/notes_screen.dart';
import '../../pyq/presentation/pyq_screen.dart';
import '../../practice/presentation/quizzes_list_screen.dart';
import '../../settings/presentation/settings_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const List<Widget> _screens = [
    DashboardScreen(),     // 0: Dashboard
    NotesScreen(),         // 1: Notes
    PyqScreen(),           // 2: Papers (Past Year Papers)
    QuizzesListScreen(),   // 3: Quizzes
    SettingsScreen(),      // 4: Account
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(selectedTabProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 280),
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          if (NecAnimations.isReducedMotion(context)) return child;
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: KeyedSubtree(
          key: ValueKey<int>(currentIndex),
          child: _screens[currentIndex.clamp(0, _screens.length - 1)],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF0B0F19) : Colors.white,
          border: Border(
            top: BorderSide(
              color: isDark ? const Color(0xFF1E293B) : Colors.grey.shade200,
              width: 1,
            ),
          ),
        ),
        child: NavigationBar(
          height: 68,
          elevation: 0,
          backgroundColor: Colors.transparent,
          indicatorColor: isDark ? const Color(0xFF23354C) : const Color(0xFFE0F2FE),
          selectedIndex: currentIndex.clamp(0, 4),
          onDestinationSelected: (idx) {
            ref.read(selectedTabProvider.notifier).state = idx;
          },
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: [
            const NavigationDestination(
              icon: Icon(Icons.grid_view_outlined, size: 22),
              selectedIcon: Icon(Icons.grid_view_rounded, color: AppTheme.primaryTeal, size: 24),
              label: 'Dashboard',
            ),
            const NavigationDestination(
              icon: Icon(Icons.menu_book_outlined, size: 22),
              selectedIcon: Icon(Icons.menu_book_rounded, color: AppTheme.primaryTeal, size: 24),
              label: 'Notes',
            ),
            const NavigationDestination(
              icon: Icon(Icons.assignment_outlined, size: 22),
              selectedIcon: Icon(Icons.assignment_rounded, color: AppTheme.primaryTeal, size: 24),
              label: 'Papers',
            ),
            const NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline, size: 22),
              selectedIcon: Icon(Icons.chat_bubble, color: AppTheme.primaryTeal, size: 24),
              label: 'Quizzes',
            ),
            NavigationDestination(
              icon: Container(
                width: 26,
                height: 26,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFBBF24),
                ),
                child: const Icon(Icons.person, color: Color(0xFF1F2937), size: 18),
              ),
              selectedIcon: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFBBF24),
                  border: Border.all(color: AppTheme.primaryTeal, width: 2),
                ),
                child: const Icon(Icons.person, color: Color(0xFF1F2937), size: 18),
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
