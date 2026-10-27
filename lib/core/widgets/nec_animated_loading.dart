import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../theme/app_theme.dart';

/// Performance-optimized Lottie Loading Indicator with zero-latency vector fallback
class NecAnimatedLoading extends StatelessWidget {
  final double size;
  final String? message;
  final Color? color;

  const NecAnimatedLoading({
    super.key,
    this.size = 72,
    this.message,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppTheme.primaryTeal;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: Lottie.asset(
              'assets/lottie/loading.json',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Center(
                child: SizedBox(
                  width: size * 0.6,
                  height: size * 0.6,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
                  ),
                ),
              ),
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 12),
            Text(
              message!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
