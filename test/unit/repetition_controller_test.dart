import 'package:flutter_test/flutter_test.dart';
import 'package:nec_cs/core/utils/repetition_controller.dart';

void main() {
  group('RepetitionController Unit Tests', () {
    late RepetitionController controller;

    setUp(() {
      controller = RepetitionController();
    });

    test('Prioritizes completely unseen questions over seen questions', () {
      final pool = ['q1', 'q2', 'q3', 'q4', 'q5'];
      // q1 and q2 have been seen yesterday
      final now = DateTime.now();
      final seenMap = {
        'q1': now.subtract(const Duration(days: 1)),
        'q2': now.subtract(const Duration(days: 2)),
      };

      // Request 3 questions
      final selected = controller.selectQuestions<String>(
        pool: pool,
        getId: (id) => id,
        questionLastSeenMap: seenMap,
        sessionSeenIds: {},
        requestedCount: 3,
      );

      expect(selected.length, 3);
      // q3, q4, q5 were unseen so all 3 must be selected
      expect(selected.contains('q3'), isTrue);
      expect(selected.contains('q4'), isTrue);
      expect(selected.contains('q5'), isTrue);
      expect(selected.contains('q1'), isFalse);
      expect(selected.contains('q2'), isFalse);
    });

    test('Prioritizes least-recently-seen questions when bank is exhausted', () {
      final pool = ['q1', 'q2', 'q3'];
      final now = DateTime.now();
      // q1 seen 1 hour ago (most recent)
      // q2 seen 5 days ago (oldest / least recently seen)
      // q3 seen 2 days ago
      final seenMap = {
        'q1': now.subtract(const Duration(hours: 1)),
        'q2': now.subtract(const Duration(days: 5)),
        'q3': now.subtract(const Duration(days: 2)),
      };

      final selected = controller.selectQuestions<String>(
        pool: pool,
        getId: (id) => id,
        questionLastSeenMap: seenMap,
        sessionSeenIds: {},
        requestedCount: 2,
      );

      expect(selected.length, 2);
      // q2 (oldest) must come before q3
      expect(selected.first, 'q2');
      expect(selected[1], 'q3');
      expect(selected.contains('q1'), isFalse); // Most recently seen is omitted
    });

    test('Strictly excludes questions already seen in the active session', () {
      final pool = ['q1', 'q2', 'q3', 'q4'];
      final sessionSeen = {'q1', 'q2'};

      final selected = controller.selectQuestions<String>(
        pool: pool,
        getId: (id) => id,
        questionLastSeenMap: {},
        sessionSeenIds: sessionSeen,
        requestedCount: 2,
      );

      expect(selected.length, 2);
      expect(selected.contains('q1'), isFalse);
      expect(selected.contains('q2'), isFalse);
      expect(selected.contains('q3'), isTrue);
      expect(selected.contains('q4'), isTrue);
    });

    test('Handles requested count larger than available pool size', () {
      final pool = ['q1', 'q2'];
      final selected = controller.selectQuestions<String>(
        pool: pool,
        getId: (id) => id,
        questionLastSeenMap: {},
        sessionSeenIds: {},
        requestedCount: 10,
      );

      expect(selected.length, 2);
    });
  });
}
