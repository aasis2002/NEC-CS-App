import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Animation Utilities and Performance-Optimized Motion System for NEC CS Prep.
///
/// Designed to respect reduced motion, minimize repaints, and provide a fluid,
/// 60fps experience across low-end and high-end Android/iOS devices.
class NecAnimations {
  /// Checks whether animations should be disabled based on accessibility settings.
  static bool isReducedMotion(BuildContext context) {
    return MediaQuery.maybeOf(context)?.disableAnimations ?? false;
  }

  /// Page Route using Material Shared Axis transition (Horizontal: sequential, Vertical: drill-down)
  static Route<T> sharedAxisRoute<T>({
    required Widget page,
    SharedAxisTransitionType transitionType = SharedAxisTransitionType.horizontal,
    Duration duration = const Duration(milliseconds: 320),
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        if (isReducedMotion(context)) return child;
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: transitionType,
          child: child,
        );
      },
    );
  }

  /// Page Route using Material Fade Through transition (Ideal for top-level navigation)
  static Route<T> fadeThroughRoute<T>({
    required Widget page,
    Duration duration = const Duration(milliseconds: 280),
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        if (isReducedMotion(context)) return child;
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
    );
  }
}

/// Extension on Widget for performant, staggered entrance animations with flutter_animate
extension NecAnimationExtensions on Widget {
  /// Applies a subtle, staggered fade + slide entrance
  Widget staggeredEntrance({
    required BuildContext context,
    int index = 0,
    Duration baseDelay = const Duration(milliseconds: 40),
    Duration duration = const Duration(milliseconds: 320),
    double offsetY = 0.08,
  }) {
    if (NecAnimations.isReducedMotion(context)) {
      return this;
    }

    final delayMs = (index.clamp(0, 10) * baseDelay.inMilliseconds);
    return animate()
        .fadeIn(
          delay: Duration(milliseconds: delayMs),
          duration: duration,
          curve: Curves.easeOutCubic,
        )
        .slideY(
          begin: offsetY,
          end: 0,
          delay: Duration(milliseconds: delayMs),
          duration: duration,
          curve: Curves.easeOutCubic,
        );
  }

  /// Subtle pulsing effect for alerts, high-yield tips, and timers
  Widget subtlePulse({
    required BuildContext context,
    bool active = true,
  }) {
    if (!active || NecAnimations.isReducedMotion(context)) {
      return this;
    }

    return animate(onPlay: (controller) => controller.repeat(reverse: true))
        .scaleXY(
          begin: 1.0,
          end: 1.03,
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOut,
        );
  }
}

/// Interactive button or card with spring-like press micro-interaction
class NecPressable extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double pressScale;
  final Duration duration;

  const NecPressable({
    super.key,
    required this.child,
    this.onTap,
    this.pressScale = 0.97,
    this.duration = const Duration(milliseconds: 110),
  });

  @override
  State<NecPressable> createState() => _NecPressableState();
}

class _NecPressableState extends State<NecPressable> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.pressScale,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuad));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails _) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails _) {
    _controller.reverse();
    widget.onTap?.call();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onTap == null) return widget.child;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        ),
        child: widget.child,
      ),
    );
  }
}
