import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nec_cs/core/widgets/app_footer.dart';

void main() {
  group('AppFooter Widget Tests', () {
    testWidgets('Renders exact required text strings with clear visual hierarchy', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      // Verify exact text matching requirements:
      // Line 1: © 2026 NEC CS
      expect(find.text('© 2026 NEC CS'), findsOneWidget);

      // Line 2: Created with care by Aashish Mehta
      expect(find.text('Created with care by Aashish Mehta'), findsOneWidget);

      // Line 3: Contact: aasismehta100@gmail.com
      expect(find.textContaining('Contact:'), findsOneWidget);
      expect(find.textContaining('aasismehta100@gmail.com'), findsOneWidget);

      // Verify Mail icon is rendered for the clickable contact touchpoint
      expect(find.byIcon(Icons.mail_outline_rounded), findsOneWidget);
    });

    testWidgets('Adapts to Dark theme and Light theme correctly', (WidgetTester tester) async {
      // Test Dark Mode
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: const Scaffold(
            body: AppFooter(),
          ),
        ),
      );
      expect(find.text('© 2026 NEC CS'), findsOneWidget);

      // Test Light Mode
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: AppFooter(),
          ),
        ),
      );
      expect(find.text('© 2026 NEC CS'), findsOneWidget);
    });

    testWidgets('Clicking email triggers fallback or launches correctly without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppFooter(),
          ),
        ),
      );

      final emailTarget = find.textContaining('aasismehta100@gmail.com');
      expect(emailTarget, findsOneWidget);

      await tester.tap(emailTarget);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      // No crash, widget remains mounted
      expect(find.byType(AppFooter), findsOneWidget);
    });
  });
}
