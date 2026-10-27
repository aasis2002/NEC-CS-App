import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../animations/nec_animations.dart';
import '../theme/app_theme.dart';

/// Premium animated empty state with Lottie animation and clean typography
class NecAnimatedEmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? fallbackIcon;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final double imageSize;

  const NecAnimatedEmptyState({
    super.key,
    required this.title,
    required this.subtitle,
    this.fallbackIcon = Icons.inbox_rounded,
    String? buttonText,
    String? ctaText,
    VoidCallback? onButtonPressed,
    VoidCallback? onCtaPressed,
    this.imageSize = 110,
  })  : buttonText = buttonText ?? ctaText,
        onButtonPressed = onButtonPressed ?? onCtaPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: imageSize,
              height: imageSize,
              child: Lottie.asset(
                'assets/lottie/empty.json',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Icon(
                  fallbackIcon,
                  size: imageSize * 0.7,
                  color: AppTheme.primaryTeal.withAlpha(isDark ? 160 : 200),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: isDark ? Colors.white : const Color(0xFF0F172A),
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),
            if (buttonText != null && onButtonPressed != null) ...[
              const SizedBox(height: 20),
              NecPressable(
                onTap: onButtonPressed,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00E5FF), Color(0xFF00BFA5)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00BFA5).withAlpha(50),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    buttonText!,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
