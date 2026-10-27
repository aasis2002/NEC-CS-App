import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Premium 3D App Logo for the Nepal Engineering Council (NEC) Computer Science app.
///
/// Combines the high-resolution 3D metallic shield asset with ambient cyan/teal
/// glow, layered 3D depth, and a high-fidelity vector fallback.
class NecAppLogo extends StatelessWidget {
  final double size;
  final bool showLabel;
  final bool enableGlow;
  final bool is3dFloating;

  const NecAppLogo({
    super.key,
    this.size = 64,
    this.showLabel = false,
    this.enableGlow = true,
    this.is3dFloating = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Widget logoBox = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(size * 0.24),
        border: Border.all(
          color: const Color(0xFF00E5FF).withAlpha(isDark ? 80 : 50),
          width: 1.5,
        ),
        boxShadow: enableGlow
            ? [
                BoxShadow(
                  color: const Color(0xFF00E5FF).withAlpha(isDark ? 55 : 35),
                  blurRadius: size * 0.35,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.black.withAlpha(isDark ? 120 : 40),
                  blurRadius: size * 0.25,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.23),
        child: Image.asset(
          'assets/images/app_logo.png',
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Elegant vector fallback if asset loading is deferred
            return _buildVectorFallback(size, isDark);
          },
        ),
      ),
    );

    if (is3dFloating) {
      logoBox = Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(-0.04)
          ..rotateY(0.02),
        child: logoBox,
      );
    }

    if (!showLabel) {
      return logoBox;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        logoBox,
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'NEC',
              style: TextStyle(
                fontSize: size * 0.26,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
                color: isDark ? Colors.white : AppTheme.primaryNavy,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'CS',
              style: TextStyle(
                fontSize: size * 0.26,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
                color: AppTheme.primaryTeal,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          'Nepal Engineering Council • License Prep',
          style: TextStyle(
            fontSize: (size * 0.12).clamp(10, 13).toDouble(),
            fontWeight: FontWeight.w500,
            color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  Widget _buildVectorFallback(double size, bool isDark) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F1E36), Color(0xFF0A1220)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.shield_rounded,
          size: size * 0.55,
          color: AppTheme.primaryTeal,
        ),
      ),
    );
  }
}
