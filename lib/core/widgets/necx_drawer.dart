import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../theme/app_theme.dart';
import 'app_footer.dart';
import 'nec_app_logo.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/notes/presentation/syllabus_modal.dart';
import '../../features/practice/presentation/bookmarks_screen.dart';

typedef NecxDrawer = NecDrawer;

class NecDrawer extends ConsumerWidget {
  final Function(int)? onNavigateTab;

  const NecDrawer({super.key, this.onNavigateTab});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authUser = ref.watch(authStateProvider);

    return Drawer(
      backgroundColor: isDark ? AppTheme.darkSurface : Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            // Header with 3D App Logo
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF161F30) : const Color(0xFFF1F5F9),
                border: Border(
                  bottom: BorderSide(
                    color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade300,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const NecAppLogo(
                    size: 46,
                    showLabel: false,
                    is3dFloating: false,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'NEC',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                letterSpacing: 1.2,
                                color: isDark ? Colors.white : AppTheme.primaryNavy,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'CS',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                letterSpacing: 1.2,
                                color: AppTheme.primaryTeal,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryTeal.withAlpha(30),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'PRO',
                                style: TextStyle(
                                  color: AppTheme.primaryTeal,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Nepal Engineering Council',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        const Text(
                          'ACtE Computer Engineering',
                          style: TextStyle(fontSize: 11, color: AppTheme.primaryTeal, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // User Account / Cloud Sync Tile
            Container(
              margin: const EdgeInsets.fromLTRB(12, 10, 12, 4),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: authUser.isGuest
                    ? (isDark ? const Color(0xFF131D2E) : const Color(0xFFF1F5F9))
                    : AppTheme.primaryTeal.withAlpha(isDark ? 25 : 15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: authUser.isGuest
                      ? (isDark ? const Color(0xFF1E2E44) : Colors.grey.shade300)
                      : AppTheme.primaryTeal.withAlpha(80),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 17,
                    backgroundColor: authUser.isGuest ? Colors.grey.shade600 : AppTheme.primaryTeal,
                    child: Icon(
                      authUser.isGuest ? Icons.person_outline : Icons.verified_user_rounded,
                      size: 19,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          authUser.isGuest ? 'Guest Mode' : authUser.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          authUser.isGuest ? 'Offline local storage' : authUser.email,
                          style: TextStyle(
                            fontSize: 10.5,
                            color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  if (authUser.isGuest)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: AppTheme.primaryTeal,
                        foregroundColor: Colors.black87,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
                      },
                      child: const Text('Sign In', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                    )
                  else
                    IconButton(
                      icon: const Icon(Icons.logout_rounded, size: 18, color: Colors.grey),
                      tooltip: 'Sign Out',
                      onPressed: () async {
                        await ref.read(authStateProvider.notifier).signOut();
                      },
                    ),
                ],
              ),
            ),

            // Navigation Links
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 4),
                children: [
                  ListTile(
                    leading: const Icon(Icons.menu_book_rounded, color: AppTheme.primaryTeal),
                    title: const Text('Official Syllabus (ACtE)'),
                    subtitle: const Text('10 Chapters • Marks Distribution', style: TextStyle(fontSize: 11)),
                    trailing: const Icon(Icons.chevron_right, size: 18),
                    onTap: () {
                      Navigator.pop(context);
                      showSyllabusModal(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.bookmark_rounded, color: Color(0xFFEC4899)),
                    title: const Text('Saved Bookmarks'),
                    subtitle: const Text('Review flagged & saved MCQs', style: TextStyle(fontSize: 11)),
                    trailing: const Icon(Icons.chevron_right, size: 18),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const BookmarksScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.history_edu_rounded, color: AppTheme.accentAmber),
                    title: const Text('Board Examination Archive'),
                    subtitle: const Text('Past year papers 2075-2083 BS', style: TextStyle(fontSize: 11)),
                    trailing: const Icon(Icons.chevron_right, size: 18),
                    onTap: () {
                      Navigator.pop(context);
                      onNavigateTab?.call(2); // Papers tab
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.quiz_rounded, color: Color(0xFF6366F1)),
                    title: const Text('Practice Question Bank'),
                    subtitle: const Text('10,000+ Permutated MCQs', style: TextStyle(fontSize: 11)),
                    trailing: const Icon(Icons.chevron_right, size: 18),
                    onTap: () {
                      Navigator.pop(context);
                      onNavigateTab?.call(3); // Quizzes tab
                    },
                  ),
                  const Divider(indent: 16, endIndent: 16),
                  ListTile(
                    leading: const Icon(Icons.wifi_off_rounded, color: AppTheme.successGreen),
                    title: const Text('Offline Ready'),
                    subtitle: const Text('SQLite Cache & PDF Notes', style: TextStyle(fontSize: 11)),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppTheme.successGreen.withAlpha(25),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('ACTIVE', style: TextStyle(color: AppTheme.successGreen, fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.help_outline_rounded, color: Colors.grey),
                    title: const Text('NEC License Exam Rules'),
                    subtitle: const Text('100 Marks • 2 Hours • 50% Pass', style: TextStyle(fontSize: 11)),
                    onTap: () {
                      Navigator.pop(context);
                      _showExamRulesDialog(context);
                    },
                  ),
                ],
              ),
            ),

            // Footer
            const AppFooter(
              showTopDivider: true,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ],
        ),
      ),
    );
  }

  void _showExamRulesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF161F30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('NEC Examination Format', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• Total Questions: 100 MCQs (1 mark each)', style: TextStyle(color: Colors.white70)),
            SizedBox(height: 6),
            Text('• Duration: 2 Hours (120 minutes)', style: TextStyle(color: Colors.white70)),
            SizedBox(height: 6),
            Text('• Qualifying Mark: 50% (50/100) (No negative marking)', style: TextStyle(color: Colors.white70)),
            SizedBox(height: 6),
            Text('• Syllabus Scope: Exactly 10 questions per unit across all 10 Units.', style: TextStyle(color: Colors.white70)),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Understood', style: TextStyle(color: AppTheme.primaryTeal))),
        ],
      ),
    );
  }
}
