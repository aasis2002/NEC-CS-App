import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  Users,
  Subjects,
  Units,
  Topics,
  Notes,
  Questions,
  QuestionOptions,
  ExamAttempts,
  AnswerLogs,
  ProgressTable,
  ReadinessScores,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'nec_cs.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}
