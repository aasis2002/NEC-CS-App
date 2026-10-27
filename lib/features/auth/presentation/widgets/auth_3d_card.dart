import 'package:flutter/material.dart';

/// 3D Floating Glassmorphic Container for premium Authentication flows.
///
/// Features subtle perspective depth, layered cyan-teal ambient glow,
/// metallic edge accents, and responsive layout protection.
class Auth3dCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? maxWidth;

  const Auth3dCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.maxWidth = 460,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final Color cardBg = isDark
        ? const Color(0xFF10192A).withAlpha(240)
        : Colors.white.withAlpha(245);

    final Color borderColor = isDark
        ? const Color(0xFF00E5FF).withAlpha(70)
        : const Color(0xFF0D9488).withAlpha(80);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth ?? 460),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              // Atmospheric cyan/teal ambient glow
              BoxShadow(
                color: const Color(0xFF00E5FF).withAlpha(isDark ? 35 : 20),
                blurRadius: 36,
                spreadRadius: 2,
                offset: const Offset(0, 8),
              ),
              // Deep directional 3D ground shadow
              BoxShadow(
                color: Colors.black.withAlpha(isDark ? 160 : 50),
                blurRadius: 28,
                spreadRadius: 0,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0006)
              ..rotateX(-0.01),
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: borderColor,
                  width: 1.5,
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
