import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

/// 3D tactile Google Sign-In button with smooth press animation,
/// authentic branding colors, and responsive layout.
class GoogleSignIn3dButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isLoading;

  const GoogleSignIn3dButton({
    super.key,
    required this.onPressed,
    this.label = 'Continue with Google',
    this.isLoading = false,
  });

  @override
  State<GoogleSignIn3dButton> createState() => _GoogleSignIn3dButtonState();
}

class _GoogleSignIn3dButtonState extends State<GoogleSignIn3dButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final Color btnBg = isDark ? const Color(0xFF162338) : Colors.white;
    final Color btnBorder = isDark ? const Color(0xFF283B56) : Colors.grey.shade300;
    final Color textColor = isDark ? Colors.white : const Color(0xFF1E293B);

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        if (!widget.isLoading) widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        width: double.infinity,
        height: 52,
        transform: Matrix4.translationValues(0, _isPressed ? 3 : 0, 0),
        decoration: BoxDecoration(
          color: btnBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _isPressed ? AppTheme.primaryTeal : btnBorder,
            width: 1.5,
          ),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: Colors.black.withAlpha(isDark ? 80 : 30),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withAlpha(isDark ? 100 : 25),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                  BoxShadow(
                    color: const Color(0xFF4285F4).withAlpha(isDark ? 40 : 25),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Center(
          child: widget.isLoading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2.2),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGoogleLogo(),
                    const SizedBox(width: 12),
                    Text(
                      widget.label,
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildGoogleLogo() {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Circular container with multi-colored 4-color Google G icon badge
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(20),
                  blurRadius: 2,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: const Text(
              'G',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w900,
                fontSize: 15,
                color: Color(0xFF4285F4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
