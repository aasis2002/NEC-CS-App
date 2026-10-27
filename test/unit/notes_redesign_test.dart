import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nec_cs/features/notes/presentation/widgets/nec_note_renderer.dart';

void main() {
  group('NecNoteRenderer Content Types Tests', () {
    testWidgets('Renders headings hierarchy (H1, H2, H3, H4) with teal badges', (WidgetTester tester) async {
      const sampleMarkdown = '''
# Chapter 1: Concept of Basic Electrical Engineering
## 1.1 Basic Concepts
### 1. Ohm's Law
#### Star (Y) Configuration
''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: NecNoteRenderer(
                markdown: sampleMarkdown,
                unitTitle: 'Unit 1: Electrical',
                topicNumber: '1',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Chapter 1: Concept of Basic Electrical Engineering'), findsOneWidget);
      expect(find.text('NEC SYLLABUS'), findsOneWidget);
      expect(find.text('SEC 1'), findsOneWidget);
      expect(find.text('1.1 Basic Concepts'), findsOneWidget);
      expect(find.text("1. Ohm's Law"), findsOneWidget);
      expect(find.text('Star (Y) Configuration'), findsOneWidget);
    });

    testWidgets('Renders definition boxes with icon and badge', (WidgetTester tester) async {
      const sampleMarkdown = '''
### 1. Ohm’s Law
Ohm’s Law states that the current flowing through a conductor is directly proportional to the voltage across it and inversely proportional to its resistance.
''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: NecNoteRenderer(markdown: sampleMarkdown),
            ),
          ),
        ),
      );

      expect(find.text('DEFINITION'), findsOneWidget);
      expect(find.textContaining('Ohm’s Law states that'), findsOneWidget);
    });

    testWidgets('Renders formula cards with centered math equation and where variables', (WidgetTester tester) async {
      const sampleMarkdown = '''
Mathematically:
* V=I×R
Where:
* V is voltage (in volts)
* I is current (in amperes)
* R is resistance (in ohms)
''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: NecNoteRenderer(markdown: sampleMarkdown),
            ),
          ),
        ),
      );

      expect(find.text('FORMULA'), findsOneWidget);
      expect(find.text('V=I×R'), findsOneWidget);
      expect(find.text('Where:'), findsOneWidget);
      expect(find.text('V is voltage (in volts)'), findsOneWidget);
      expect(find.text('I is current (in amperes)'), findsOneWidget);
      expect(find.text('R is resistance (in ohms)'), findsOneWidget);
    });

    testWidgets('Renders responsive tables with formatted headers and rows', (WidgetTester tester) async {
      const sampleMarkdown = '''
| Feature | RISC | CISC |
| --- | --- | --- |
| Instruction Set | Small, simple | Large, complex |
| Execution Time | Single cycle | Multiple cycles |
''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: NecNoteRenderer(markdown: sampleMarkdown),
            ),
          ),
        ),
      );

      expect(find.text('Feature'), findsOneWidget);
      expect(find.text('RISC'), findsOneWidget);
      expect(find.text('CISC'), findsOneWidget);
      expect(find.text('Instruction Set'), findsOneWidget);
      expect(find.text('Small, simple'), findsOneWidget);
      expect(find.text('Large, complex'), findsOneWidget);
    });

    testWidgets('Renders programming code blocks with language badge and Copy button', (WidgetTester tester) async {
      const sampleMarkdown = '''
```c
#include <stdio.h>
int main() {
    printf("Hello NEC CS");
    return 0;
}
```
''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: NecNoteRenderer(markdown: sampleMarkdown),
            ),
          ),
        ),
      );

      expect(find.text('C'), findsOneWidget);
      expect(find.text('Copy'), findsOneWidget);
      expect(find.textContaining('printf("Hello NEC CS");'), findsOneWidget);

      // Tap copy button
      await tester.tap(find.text('Copy'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
    });

    testWidgets('Renders High-Yield Exam Tip callout cards', (WidgetTester tester) async {
      const sampleMarkdown = '''
> **Exam Weightage**: 10 Marks (Part A Short + Part B Long questions). Passing score is 50%.
**Key Point:** If one component fails in a series circuit, current flow stops.
''';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: NecNoteRenderer(markdown: sampleMarkdown),
            ),
          ),
        ),
      );

      expect(find.text('NEC Board Exam Weightage'), findsOneWidget);
      expect(find.text('Key Board Exam Takeaway'), findsOneWidget);
      expect(find.byIcon(Icons.star_rounded), findsWidgets);
    });
  });

  group('Notes Markdown Cleanliness & Integrity Verification', () {
    test('All 10 unit markdown files exist and have zero duplicate headings', () {
      final notesDir = Directory('assets/notes');
      expect(notesDir.existsSync(), isTrue);

      final mdFiles = notesDir
          .listSync()
          .whereType<File>()
          .where((f) => f.path.endsWith('.md'))
          .toList();

      expect(mdFiles.length, equals(10));

      final dupPattern = RegExp(r'##\s+([0-9]+\.[0-9]+[^\r\n]*)\r?\n+\s*#\s+\1');
      final figureTagPattern = RegExp(r'<figure>');
      final htmlTablePattern = RegExp(r'<table');

      for (final file in mdFiles) {
        final content = file.readAsStringSync();
        expect(content.isNotEmpty, isTrue);

        // Verify zero duplicate headings
        final dupMatches = dupPattern.allMatches(content);
        expect(dupMatches.length, equals(0), reason: 'Duplicate headings found in ${file.path}');

        // Verify raw HTML figures are cleaned
        final figMatches = figureTagPattern.allMatches(content);
        expect(figMatches.length, equals(0), reason: 'Raw <figure> tags found in ${file.path}');

        // Verify raw HTML tables are converted to Markdown tables
        final tblMatches = htmlTablePattern.allMatches(content);
        expect(tblMatches.length, equals(0), reason: 'Raw <table> tags found in ${file.path}');
      }
    });
  });
}
