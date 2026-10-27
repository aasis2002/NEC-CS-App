import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

/// Reusable, theme-aware application footer for the NEC CS License Preparation App.
///
/// Displays official copyright, creator credit, and interactive contact info.
/// Fully responsive across all mobile screen sizes with Light and Dark mode support.
class AppFooter extends StatelessWidget {
  final bool showTopDivider;
  final EdgeInsetsGeometry? padding;

  const AppFooter({
    super.key,
    this.showTopDivider = true,
    this.padding,
  });

  static const String copyrightText = '© 2026 NEC CS';
  static const String creatorText = 'Created with care by Aashish Mehta';
  static const String emailAddress = 'aasismehta100@gmail.com';
  static const String contactText = 'Contact: $emailAddress';

  Future<void> _handleEmailTap(BuildContext context) async {
    final emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      queryParameters: {
        'subject': 'NEC CS License App Feedback / Inquiry',
      },
    );

    try {
      final launched = await launchUrl(
        emailUri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched && context.mounted) {
        await _copyEmailFallback(context);
      }
    } catch (_) {
      if (context.mounted) {
        await _copyEmailFallback(context);
      }
    }
  }

  Future<void> _copyEmailFallback(BuildContext context) async {
    await Clipboard.setData(const ClipboardData(text: emailAddress));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle_outline, color: AppTheme.primaryTeal, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Email copied to clipboard: $emailAddress',
                  style: const TextStyle(fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Palette: Premium Navy, Teal accents, Light Slate
    final Color footerBg = isDark ? const Color(0xFF0B0F19) : const Color(0xFFF8FAFC);
    final Color borderColor = isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0);
    final Color copyrightColor = isDark ? Colors.white.withAlpha(225) : const Color(0xFF0F172A);
    final Color creatorColor = isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);
    final Color tealAccent = isDark ? AppTheme.primaryTeal : const Color(0xFF0D9488);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: footerBg,
        border: showTopDivider
            ? Border(
                top: BorderSide(
                  color: borderColor,
                  width: 1.0,
                ),
              )
            : null,
      ),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Subtle top decorative brand bar
              Container(
                width: 32,
                height: 3,
                decoration: BoxDecoration(
                  color: tealAccent.withAlpha(isDark ? 80 : 120),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 12),

              // Line 1: Copyright text
              Text(
                copyrightText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                  color: copyrightColor,
                ),
              ),
              const SizedBox(height: 5),

              // Line 2: Creator credit
              Text(
                creatorText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: creatorColor,
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 8),

              // Line 3: Interactive Contact Email
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _handleEmailTap(context),
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: TextAlign.center == TextAlign.center
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.mail_outline_rounded,
                          size: 15,
                          color: tealAccent,
                        ),
                        const SizedBox(width: 6),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Contact: ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: creatorColor,
                                ),
                              ),
                              TextSpan(
                                text: emailAddress,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: tealAccent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: tealAccent.withAlpha(120),
                                  decorationThickness: 1.2,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
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
