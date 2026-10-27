import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_footer.dart';
import '../../../core/widgets/nec_app_logo.dart';
import '../../home/presentation/home_screen.dart';
import 'login_screen.dart';
import 'widgets/auth_3d_card.dart';
import 'widgets/google_sign_in_3d_button.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _collegeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  bool _isGoogleLoading = false;
  bool _agreeTerms = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _collegeController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  double _calculatePasswordStrength(String password) {
    if (password.isEmpty) return 0.0;
    double strength = 0.0;
    if (password.length >= 6) strength += 0.25;
    if (password.length >= 8) strength += 0.25;
    if (RegExp(r'[0-9]').hasMatch(password)) strength += 0.25;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) strength += 0.25;
    return strength;
  }

  Color _getStrengthColor(double strength) {
    if (strength <= 0.25) return Colors.redAccent;
    if (strength <= 0.5) return Colors.orangeAccent;
    if (strength <= 0.75) return Colors.amber;
    return const Color(0xFF00E5FF);
  }

  String _getStrengthLabel(double strength) {
    if (strength == 0.0) return '';
    if (strength <= 0.25) return 'Weak';
    if (strength <= 0.5) return 'Fair';
    if (strength <= 0.75) return 'Good';
    return 'Strong & Secure';
  }

  Future<void> _handleSignUp() async {
    if (!_agreeTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept the engineering code of conduct to proceed.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final success = await ref.read(authStateProvider.notifier).signUpWithEmail(
            name: _nameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            college: _collegeController.text.isNotEmpty ? _collegeController.text : null,
          );
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully! Welcome to NEC CS Prep.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
          (route) => false,
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleGoogleSignUp() async {
    setState(() => _isGoogleLoading = true);
    try {
      final success = await ref.read(authStateProvider.notifier).signInWithGoogle();
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Signed up with Google! Cloud profile activated.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
          (route) => false,
        );
      }
    } finally {
      if (mounted) setState(() => _isGoogleLoading = false);
    }
  }

  void _continueAsGuest() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final passwordStrength = _calculatePasswordStrength(_passwordController.text);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF070B14) : const Color(0xFFF1F5F9),
      body: Stack(
        children: [
          // Ambient 3D background glow
          Positioned(
            top: -120,
            left: 0,
            right: 0,
            height: 420,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  radius: 0.95,
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 6),

                  // 3D App Logo
                  const NecAppLogo(
                    size: 80,
                    showLabel: true,
                    is3dFloating: true,
                  ),

                  const SizedBox(height: 20),

                  // 3D Glassmorphic Auth Card
                  Auth3dCard(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Create Account',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      'Start your engineering licensure preparation',
                                      style: TextStyle(
                                        fontSize: 12.5,
                                        color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryTeal.withAlpha(isDark ? 30 : 20),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppTheme.primaryTeal.withAlpha(60)),
                                ),
                                child: const Icon(
                                  Icons.person_add_alt_1_rounded,
                                  color: AppTheme.primaryTeal,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 22),

                          // Full Name
                          _buildLabel('Full Name', isDark),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _nameController,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 14),
                            decoration: _inputDecoration(
                              hintText: 'Er. Aashish Mehta',
                              icon: Icons.person_outline_rounded,
                              isDark: isDark,
                            ),
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) return 'Please enter your full name';
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),

                          // Email Address
                          _buildLabel('Email Address', isDark),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 14),
                            decoration: _inputDecoration(
                              hintText: 'engineer@example.com',
                              icon: Icons.mail_outline_rounded,
                              isDark: isDark,
                            ),
                            validator: (val) {
                              if (val == null || val.trim().isEmpty) return 'Please enter your email';
                              if (!val.contains('@') || !val.contains('.')) return 'Please enter a valid email';
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),

                          // Engineering College / Institution (Optional)
                          Text.rich(
                            TextSpan(
                              text: 'Engineering College / University ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.grey.shade300 : const Color(0xFF334155),
                              ),
                              children: [
                                TextSpan(
                                  text: '(Optional)',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                    color: isDark ? Colors.grey.shade500 : Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _collegeController,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 14),
                            decoration: _inputDecoration(
                              hintText: 'Pulchowk / Thapathali / KU / TU',
                              icon: Icons.school_outlined,
                              isDark: isDark,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Password Field
                          _buildLabel('Password', isDark),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            onChanged: (_) => setState(() {}),
                            style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 14),
                            decoration: _inputDecoration(
                              hintText: 'At least 6 characters',
                              icon: Icons.lock_outline_rounded,
                              isDark: isDark,
                              suffix: IconButton(
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                              ),
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) return 'Please enter a password';
                              if (val.length < 6) return 'Password must be at least 6 characters';
                              return null;
                            },
                          ),

                          // Password Strength Indicator
                          if (_passwordController.text.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: LinearProgressIndicator(
                                      value: passwordStrength,
                                      backgroundColor: isDark ? const Color(0xFF1E2F48) : Colors.grey.shade200,
                                      valueColor: AlwaysStoppedAnimation<Color>(_getStrengthColor(passwordStrength)),
                                      minHeight: 5,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  _getStrengthLabel(passwordStrength),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: _getStrengthColor(passwordStrength),
                                  ),
                                ),
                              ],
                            ),
                          ],

                          const SizedBox(height: 16),

                          // Confirm Password Field
                          _buildLabel('Confirm Password', isDark),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: _obscureConfirmPassword,
                            style: TextStyle(color: isDark ? Colors.white : Colors.black87, fontSize: 14),
                            decoration: _inputDecoration(
                              hintText: 'Re-enter your password',
                              icon: Icons.lock_reset_rounded,
                              isDark: isDark,
                              suffix: IconButton(
                                icon: Icon(
                                  _obscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                              ),
                            ),
                            validator: (val) {
                              if (val != _passwordController.text) return 'Passwords do not match';
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),

                          // Agreement Checkbox
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 22,
                                height: 22,
                                child: Checkbox(
                                  value: _agreeTerms,
                                  activeColor: AppTheme.primaryTeal,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  onChanged: (val) => setState(() => _agreeTerms = val ?? true),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'I agree to the NEC Engineering Code of Ethics & preparation study terms',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
                                    height: 1.3,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 22),

                          // 3D Primary Create Account Button
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
                              onPressed: _isLoading ? null : _handleSignUp,
                              child: _isLoading
                                  ? const SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.2),
                                    )
                                  : const Text(
                                      'Create Account',
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

                          // Divider "OR"
                          Row(
                            children: [
                              Expanded(child: Divider(color: isDark ? const Color(0xFF1E2E44) : Colors.grey.shade300)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: isDark ? Colors.grey.shade500 : Colors.grey.shade600,
                                  ),
                                ),
                              ),
                              Expanded(child: Divider(color: isDark ? const Color(0xFF1E2E44) : Colors.grey.shade300)),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // 3D Google Sign-Up Button
                          GoogleSignIn3dButton(
                            label: 'Sign up with Google',
                            isLoading: _isGoogleLoading,
                            onPressed: _handleGoogleSignUp,
                          ),

                          const SizedBox(height: 20),

                          // Sign In Link
                          Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                                    );
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.primaryTeal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Continue as Guest Option
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
                    ),
                    icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                    label: const Text(
                      'Continue as Guest (Offline Mode)',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    onPressed: _continueAsGuest,
                  ),

                  const SizedBox(height: 24),
                  const AppFooter(showTopDivider: false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text, bool isDark) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: isDark ? Colors.grey.shade300 : const Color(0xFF334155),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hintText,
    required IconData icon,
    required bool isDark,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: isDark ? Colors.grey.shade600 : Colors.grey.shade400, fontSize: 13),
      prefixIcon: Icon(icon, size: 20, color: AppTheme.primaryTeal),
      suffixIcon: suffix,
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
    );
  }
}
