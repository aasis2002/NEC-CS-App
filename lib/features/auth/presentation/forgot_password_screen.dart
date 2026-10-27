import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_footer.dart';
import '../../../core/widgets/nec_app_logo.dart';
import 'login_screen.dart';
import 'widgets/auth_3d_card.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _isSubmitted = false;
  int _resendCooldown = 0;
  Timer? _timer;

  @override
  void dispose() {
    _emailController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startCooldown() {
    setState(() => _resendCooldown = 30);
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendCooldown > 0) {
        setState(() => _resendCooldown--);
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> _handleResetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final success = await ref
          .read(authStateProvider.notifier)
          .sendPasswordReset(_emailController.text.trim());
      if (success && mounted) {
        setState(() => _isSubmitted = true);
        _startCooldown();
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF070B14) : const Color(0xFFF1F5F9),
      body: Stack(
        children: [
          // Ambient 3D background glow
          Positioned(
            top: -100,
            left: 0,
            right: 0,
            height: 380,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  radius: 0.9,
                  colors: [
                    const Color(0xFF00E5FF).withAlpha(isDark ? 45 : 25),
                    const Color(0xFF00BFA5).withAlpha(isDark ? 20 : 10),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  // Back button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: isDark ? Colors.white70 : const Color(0xFF1E293B),
                        size: 20,
                      ),
                      onPressed: () => Navigator.pop(context),
                      tooltip: 'Back to Sign In',
                    ),
                  ),

                  const SizedBox(height: 6),

                  // 3D App Logo
                  const NecAppLogo(
                    size: 80,
                    showLabel: true,
                    is3dFloating: true,
                  ),

                  const SizedBox(height: 24),

                  // 3D Card
                  Auth3dCard(
                    child: _isSubmitted
                        ? _buildSuccessView(isDark)
                        : _buildFormView(isDark),
                  ),

                  const SizedBox(height: 28),
                  const AppFooter(showTopDivider: false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormView(bool isDark) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.primaryTeal.withAlpha(isDark ? 35 : 20),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.primaryTeal.withAlpha(70)),
                ),
                child: const Icon(
                  Icons.lock_reset_rounded,
                  color: AppTheme.primaryTeal,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Recover your engineering exam account',
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            'Enter your registered email address and we will dispatch a secure reset link to recover your account credentials.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
              color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
            ),
          ),

          const SizedBox(height: 22),

          // Email Input
          Text(
            'Registered Email Address',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.grey.shade300 : const Color(0xFF334155),
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 14),
            decoration: InputDecoration(
              hintText: 'engineer@example.com',
              hintStyle: TextStyle(
                color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
                fontSize: 13,
              ),
              prefixIcon: const Icon(Icons.mail_outline_rounded, size: 20, color: AppTheme.primaryTeal),
              filled: true,
              fillColor: isDark ? const Color(0xFF0D1522) : const Color(0xFFF8FAFC),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: isDark ? const Color(0xFF1E2F48) : Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: isDark ? const Color(0xFF1E2F48) : Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppTheme.primaryTeal, width: 1.5),
              ),
            ),
            validator: (val) {
              if (val == null || val.trim().isEmpty) return 'Please enter your email';
              if (!val.contains('@') || !val.contains('.')) return 'Please enter a valid email';
              return null;
            },
          ),

          const SizedBox(height: 26),

          // 3D Primary Button
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00E5FF), Color(0xFF00BFA5), Color(0xFF0D9488)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00BFA5).withAlpha(80),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: _isLoading ? null : _handleResetPassword,
              child: _isLoading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.2),
                    )
                  : const Text(
                      'Send Reset Link',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                        letterSpacing: 0.5,
                      ),
                    ),
            ),
          ),

          const SizedBox(height: 20),

          // Back to Login Link
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.arrow_back_rounded, size: 16, color: AppTheme.primaryTeal),
                  SizedBox(width: 6),
                  Text(
                    'Return to Sign In',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryTeal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessView(bool isDark) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF00E5FF).withAlpha(isDark ? 35 : 25),
            border: Border.all(color: const Color(0xFF00E5FF).withAlpha(120), width: 2),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00E5FF).withAlpha(50),
                blurRadius: 18,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Icon(
            Icons.mark_email_read_rounded,
            color: Color(0xFF00E5FF),
            size: 34,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Reset Link Sent!',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: isDark ? Colors.white : const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'We have dispatched password recovery instructions to:\n${_emailController.text.trim()}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            height: 1.45,
            color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 26),

        // Return to Sign In Button
        Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF00E5FF), Color(0xFF00BFA5)],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            child: const Text(
              'Back to Sign In',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),

        const SizedBox(height: 14),

        // Resend button
        TextButton(
          onPressed: _resendCooldown > 0 ? null : _handleResetPassword,
          child: Text(
            _resendCooldown > 0
                ? 'Resend email in ${_resendCooldown}s'
                : 'Did not receive email? Resend',
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: _resendCooldown > 0
                  ? Colors.grey
                  : AppTheme.primaryTeal,
            ),
          ),
        ),
      ],
    );
  }
}
