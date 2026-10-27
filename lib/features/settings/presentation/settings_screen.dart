import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_footer.dart';
import '../../auth/presentation/login_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeProvider);
    final currentLocale = ref.watch(localeProvider);
    final authUser = ref.watch(authStateProvider);
    final currentUserId = authUser.id;
    final isGuest = authUser.isGuest;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account & Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Account / Guest Status Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: isGuest ? Colors.grey.shade400 : AppTheme.primaryTeal,
                        child: Icon(
                          isGuest ? Icons.person_outline : Icons.engineering_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isGuest ? 'Guest Mode (Local Storage)' : authUser.name,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              isGuest
                                  ? 'Your progress is saved offline. Sign in with Google/Email to sync across devices.'
                                  : '${authUser.email} • Cloud Sync Active',
                              style: TextStyle(
                                fontSize: 12,
                                color: isGuest ? Colors.grey.shade600 : AppTheme.primaryTeal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (isGuest)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.cloud_sync_outlined),
                        label: const Text('Sign In with Google / Email to Sync'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const LoginScreen()),
                          );
                        },
                      ),
                    )
                  else
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.logout),
                        label: const Text('Sign Out to Guest Mode'),
                        onPressed: () async {
                          await ref.read(authStateProvider.notifier).signOut();
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Signed out. Local guest mode active.'),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 2. Preferences (Theme & Language)
          Text('Preferences', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.dark_mode_outlined, color: AppTheme.primaryBlue),
                  title: const Text('Theme Mode', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: Text(
                    currentTheme == ThemeMode.system
                        ? 'Follow System'
                        : (currentTheme == ThemeMode.dark ? 'Dark Mode' : 'Light Mode'),
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: DropdownButton<ThemeMode>(
                    value: currentTheme,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(value: ThemeMode.system, child: Text('System')),
                      DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
                      DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
                    ],
                    onChanged: (mode) {
                      if (mode != null) {
                        ref.read(themeModeProvider.notifier).state = mode;
                      }
                    },
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.translate, color: AppTheme.primaryAccent),
                  title: const Text('Language / भाषा', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: Text(
                    currentLocale.languageCode == 'ne' ? 'नेपाली (Nepali)' : 'English',
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: DropdownButton<String>(
                    value: currentLocale.languageCode,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(value: 'en', child: Text('English')),
                      DropdownMenuItem(value: 'ne', child: Text('नेपाली')),
                    ],
                    onChanged: (code) {
                      if (code != null) {
                        ref.read(localeProvider.notifier).state = Locale(code);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 3. Question Bank & Data Management
          Text('Data & Repetition Control', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.refresh, color: AppTheme.accentAmber),
                  title: const Text('Reset Question Repetition Pool', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: const Text('Clears seen history so all questions become brand new', style: TextStyle(fontSize: 12)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    await ref.read(repositoryProvider).resetQuestionPool(currentUserId);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Question history reset successfully!')),
                      );
                    }
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.cloud_upload_outlined, color: AppTheme.primaryBlue),
                  title: const Text('Sync with Cloud Firestore Now', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: const Text('Applies Last-Write-Wins conflict resolution', style: TextStyle(fontSize: 12)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    await ref.read(syncServiceProvider).syncUp(
                          ref.read(databaseProvider),
                          currentUserId,
                        );
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Cloud sync completed with 0 conflicts.')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 4. About NEC License Exam
          Text('About Examination', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nepal Engineering Council (NEC) Examination',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '• Computer Engineering Syllabus (ACtE) Chapters 1 to 10.\n'
                    '• Full Exam: 50 Questions, 90 Minutes duration.\n'
                    '• Pass Mark: 50% (25 / 50 marks).\n'
                    '• Negative Marking: None.\n'
                    '• Statutory Authority: Nepal Engineering Council Act 2055.',
                    style: TextStyle(fontSize: 12, height: 1.6, color: isDark ? Colors.grey.shade300 : Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
          const AppFooter(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
