import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../database/app_database.dart';
import '../database/nec_repository.dart';
import '../network/sync_service.dart';
import '../utils/readiness_calculator.dart';

// Database & Repository Singletons
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final repositoryProvider = Provider<NecRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return NecRepository(db);
});

final syncServiceProvider = Provider<ISyncService>((ref) {
  return CloudFirestoreSyncService();
});

// App Settings (Theme & Localization)
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.dark);

final selectedTabProvider = StateProvider<int>((ref) => 0);

final localeProvider = StateProvider<Locale>((ref) => const Locale('en'));

// Current User State
final currentUserIdProvider = StateProvider<String>((ref) => 'local_guest_user');

// Data Streams
final unitsStreamProvider = StreamProvider<List<Unit>>((ref) {
  final repo = ref.watch(repositoryProvider);
  return repo.watchUnits();
});

final readinessScoreStreamProvider = StreamProvider<ReadinessBreakdown>((ref) {
  final repo = ref.watch(repositoryProvider);
  final userId = ref.watch(currentUserIdProvider);
  return repo.watchReadinessScore(userId);
});

final notesByUnitStreamProvider = StreamProvider.family<List<Note>, String>((ref, unitId) {
  final repo = ref.watch(repositoryProvider);
  return repo.watchNotes(unitId);
});

final examAttemptsStreamProvider = StreamProvider<List<ExamAttempt>>((ref) {
  final repo = ref.watch(repositoryProvider);
  final userId = ref.watch(currentUserIdProvider);
  return repo.watchExamAttempts(userId);
});

final analyticsFutureProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final repo = ref.watch(repositoryProvider);
  final userId = ref.watch(currentUserIdProvider);
  return repo.getAnalytics(userId);
});
