import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nec_cs/features/notes/presentation/pdf_viewer_screen.dart';
import 'package:nec_cs/features/notes/presentation/widgets/nec_note_renderer.dart';

void main() {
  testWidgets('PdfViewerScreen toggles dark mode correctly when tapping night mode icon', (tester) async {
    const testMarkdown = '# Chapter 1: Digital Logic\n\n> Important exam concept for NEC CS';

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        home: const PdfViewerScreen(
          title: 'Digital Logic Notes',
          unitTitle: 'Unit 1: Digital Logic',
          topicNumber: '1.1',
          content: testMarkdown,
          fileSize: '1.2 MB',
        ),
      ),
    );
    await tester.pumpAndSettle();

    // In light mode, find dark mode icon
    final darkModeAction = find.byIcon(Icons.dark_mode_outlined);
    expect(darkModeAction, findsOneWidget);

    // Renderer initially has forceDarkMode: false
    NecNoteRenderer renderer = tester.widget(find.byType(NecNoteRenderer));
    expect(renderer.forceDarkMode, isFalse);

    // Tap toggle to switch to dark mode
    await tester.tap(darkModeAction);
    await tester.pumpAndSettle();

    // Now light mode icon is visible because PDF is currently in dark mode
    expect(find.byIcon(Icons.light_mode), findsOneWidget);

    // NecNoteRenderer now receives forceDarkMode: true
    renderer = tester.widget(find.byType(NecNoteRenderer));
    expect(renderer.forceDarkMode, isTrue);

    // Tap again to switch back to light mode
    await tester.tap(find.byIcon(Icons.light_mode));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.dark_mode_outlined), findsOneWidget);
    renderer = tester.widget(find.byType(NecNoteRenderer));
    expect(renderer.forceDarkMode, isFalse);
  });
}
