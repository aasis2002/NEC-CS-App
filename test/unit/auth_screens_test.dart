import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nec_cs/core/providers/auth_provider.dart';
import 'package:nec_cs/features/auth/presentation/login_screen.dart';
import 'package:nec_cs/features/auth/presentation/signup_screen.dart';
import 'package:nec_cs/features/auth/presentation/forgot_password_screen.dart';
import 'package:nec_cs/features/auth/presentation/widgets/auth_3d_card.dart';
import 'package:nec_cs/features/auth/presentation/widgets/google_sign_in_3d_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('Auth Provider State Tests', () {
    test('Initial user state is guest', () {
      final container = ProviderContainer();
      final user = container.read(authStateProvider);
      expect(user.isGuest, isTrue);
      expect(user.email, 'guest@nec-cs.local');
    });

    test('Sign in with email updates user state to authenticated', () async {
      final container = ProviderContainer();
      final success = await container
          .read(authStateProvider.notifier)
          .signInWithEmail('engineer@nec.edu.np', 'password123');

      expect(success, isTrue);
      final user = container.read(authStateProvider);
      expect(user.isGuest, isFalse);
      expect(user.email, 'engineer@nec.edu.np');
    });

    test('Sign in with Google updates user state with Google credentials', () async {
      final container = ProviderContainer();
      final success = await container.read(authStateProvider.notifier).signInWithGoogle();

      expect(success, isTrue);
      final user = container.read(authStateProvider);
      expect(user.isGuest, isFalse);
      expect(user.email, 'aasismehta100@gmail.com');
      expect(user.name, 'Aashish Mehta');
    });

    test('Sign out resets state to guest', () async {
      final container = ProviderContainer();
      await container.read(authStateProvider.notifier).signInWithGoogle();
      expect(container.read(authStateProvider).isGuest, isFalse);

      await container.read(authStateProvider.notifier).signOut();
      expect(container.read(authStateProvider).isGuest, isTrue);
    });
  });

  group('LoginScreen Widget Tests', () {
    testWidgets('Renders 3D Card, inputs, Sign In button, and Google 3D button', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Auth3dCard), findsOneWidget);
      expect(find.byType(GoogleSignIn3dButton), findsOneWidget);
      expect(find.text('Sign In'), findsAtLeastNWidgets(1));
      expect(find.text('Sign in with Google'), findsOneWidget);
      expect(find.text('Forgot Password?'), findsOneWidget);
      expect(find.text('Sign Up'), findsOneWidget);
      expect(find.text('Continue as Guest (Offline Mode)'), findsOneWidget);
    });

    testWidgets('Empty email and password triggers form validation error', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );
      await tester.pump();

      // Tap Sign In button with empty fields
      final signInButton = find.widgetWithText(ElevatedButton, 'Sign In');
      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      expect(find.text('Please enter your email'), findsOneWidget);
    });
  });

  group('SignUpScreen Widget Tests', () {
    testWidgets('Renders all fields and Google sign up button', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: SignUpScreen(),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Auth3dCard), findsOneWidget);
      expect(find.text('Create Account'), findsAtLeastNWidgets(1));
      expect(find.text('Sign up with Google'), findsOneWidget);
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
      expect(find.text('Already have an account? '), findsOneWidget);
    });

    testWidgets('Password strength indicator displays when typing password', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: SignUpScreen(),
          ),
        ),
      );
      await tester.pump();

      final textFields = find.byType(TextFormField);
      // Password field is the 4th TextFormField
      await tester.enterText(textFields.at(3), 'StrongPass!123');
      await tester.pump();

      expect(find.text('Strong & Secure'), findsOneWidget);
    });
  });

  group('ForgotPasswordScreen Widget Tests', () {
    testWidgets('Renders reset instructions and sends reset link', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: ForgotPasswordScreen(),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Forgot Password?'), findsOneWidget);
      expect(find.text('Send Reset Link'), findsOneWidget);
      expect(find.text('Return to Sign In'), findsOneWidget);

      // Enter valid email
      await tester.enterText(find.byType(TextFormField), 'engineer@nec.edu.np');
      await tester.pump();

      await tester.tap(find.text('Send Reset Link'));
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pumpAndSettle();

      expect(find.text('Reset Link Sent!'), findsOneWidget);
      expect(find.text('Back to Sign In'), findsOneWidget);
    });
  });
}
