import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';
import '../theme/app_theme.dart';

typedef NecxAppBar = NecAppBar;

class NecAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final List<Widget>? extraActions;

  const NecAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.extraActions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: isDark ? AppTheme.darkBg : AppTheme.lightBg,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).maybePop(),
            )
          : Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
      centerTitle: true,
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: isDark ? Colors.white : AppTheme.primaryNavy,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'NEC',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    color: isDark ? Colors.white : AppTheme.primaryNavy,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  'CS',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    color: AppTheme.primaryTeal,
                  ),
                ),
              ],
            ),
      actions: [
        ...?extraActions,
        // Theme toggle
        IconButton(
          icon: Icon(
            isDark ? Icons.nightlight_round : Icons.wb_sunny_outlined,
            size: 20,
            color: isDark ? Colors.white70 : Colors.black87,
          ),
          tooltip: 'Toggle Theme',
          onPressed: () {
            final nextMode = isDark ? ThemeMode.light : ThemeMode.dark;
            ref.read(themeModeProvider.notifier).state = nextMode;
          },
        ),
        // Notifications with red badge '6'
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                size: 22,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
              tooltip: 'Notifications',
              onPressed: () => _showNotificationsDialog(context),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: AppTheme.errorRed,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: const Text(
                  '6',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 6),
      ],
    );
  }

  void _showNotificationsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF161F30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.notifications_active, color: AppTheme.primaryTeal, size: 22),
            SizedBox(width: 10),
            Text('Exam Board Notices', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: const [
              _NotificationItem(
                title: 'NEC License Examination 2083',
                message: 'Next computer engineering license sitting scheduled for Ashad 2083. Complete all 10 unit practice sets.',
                date: 'Just now',
                isUnread: true,
              ),
              _NotificationItem(
                title: '29 Full Syllabus Model Sets Available',
                message: 'Simulated practice sets updated with 10,000+ question bank permutations & official scoring rules.',
                date: '2 hrs ago',
                isUnread: true,
              ),
              _NotificationItem(
                title: 'Past Board Examination 2083 Added',
                message: 'Solved paper for Ashad 21 session with full step-by-step explanations is now live.',
                date: 'Yesterday',
                isUnread: true,
              ),
              _NotificationItem(
                title: 'Chapter PDF Notes Synchronized',
                message: 'High-yield PDF summaries for all 10 ACtE chapters are cached for offline study.',
                date: '2 days ago',
                isUnread: false,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close', style: TextStyle(color: AppTheme.primaryTeal)),
          ),
        ],
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final String date;
  final bool isUnread;

  const _NotificationItem({
    required this.title,
    required this.message,
    required this.date,
    required this.isUnread,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isUnread ? const Color(0xFF1F2C44) : const Color(0xFF131B2A),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isUnread ? AppTheme.primaryTeal.withAlpha(80) : Colors.white10,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            message,
            style: const TextStyle(color: Colors.white70, fontSize: 12, height: 1.3),
          ),
        ],
      ),
    );
  }
}
