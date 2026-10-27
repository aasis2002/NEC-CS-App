import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nec_cs/core/database/app_database.dart';
import 'package:nec_cs/core/database/nec_repository.dart';
import 'package:nec_cs/core/providers/app_providers.dart';
import 'package:nec_cs/main.dart';

void main() {
  testWidgets('NecApp smoke test loads and renders dashboard', (WidgetTester tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    final repo = NecRepository(db);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(db),
          repositoryProvider.overrideWithValue(repo),
        ],
        child: const NecApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('NEC'), findsWidgets);
    expect(find.text('CS'), findsWidgets);
    expect(find.text('Study Materials'), findsOneWidget);
    expect(find.text('Attempt Exam Now'), findsOneWidget);
    expect(find.text('Practice Model Sets'), findsOneWidget);
    expect(find.text('Quizzes'), findsWidgets);
    expect(find.text('Notes'), findsWidgets);
    expect(find.text('Past Papers'), findsWidgets);

    await db.close();
  });
}
