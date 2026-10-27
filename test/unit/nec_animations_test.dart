import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nec_cs/core/animations/nec_animations.dart';
import 'package:nec_cs/core/widgets/nec_animated_empty_state.dart';

void main() {
  group('NecAnimations & UI Components Test', () {
    testWidgets('NecPressable renders and responds to tap', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NecPressable(
              onTap: () => tapped = true,
              child: const Text('Tap Me'),
            ),
          ),
        ),
      );

      expect(find.text('Tap Me'), findsOneWidget);
      await tester.tap(find.text('Tap Me'));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('NecAnimatedEmptyState renders title and subtitle with fallback icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NecAnimatedEmptyState(
              title: 'No Data Found',
              subtitle: 'Please try searching something else.',
              ctaText: 'Reset',
              onCtaPressed: () {},
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text('No Data Found'), findsOneWidget);
      expect(find.text('Please try searching something else.'), findsOneWidget);
      expect(find.text('Reset'), findsOneWidget);
    });

    testWidgets('staggeredEntrance extension renders widget properly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return const Text('Animated Item').staggeredEntrance(context: context, index: 0);
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('Animated Item'), findsOneWidget);
    });
  });
}
