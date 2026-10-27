import 'dart:math';

/// Controls question selection to eliminate repetitive questions.
/// Prioritizes:
/// 1. Unseen questions (never attempted in AnswerLog)
/// 2. Least-recently-seen questions (oldest timestamp in AnswerLog)
/// 3. In-session exclusion (prevents serving the same question in a single session)
class RepetitionController {
  final Random _random;

  RepetitionController({Random? random}) : _random = random ?? Random();

  List<T> selectQuestions<T>({
    required List<T> pool,
    required String Function(T) getId,
    required Map<String, DateTime> questionLastSeenMap,
    required Set<String> sessionSeenIds,
    required int requestedCount,
  }) {
    if (pool.isEmpty || requestedCount <= 0) return [];

    // Filter out questions already served in the current session
    List<T> available = pool.where((item) => !sessionSeenIds.contains(getId(item))).toList();

    // If pool is completely exhausted in this session, fallback to all pool items
    if (available.isEmpty) {
      available = List.from(pool);
    }

    // Partition into Unseen and Seen
    final List<T> unseen = [];
    final List<MapEntry<T, DateTime>> seenWithTimestamp = [];

    for (final item in available) {
      final id = getId(item);
      final lastSeen = questionLastSeenMap[id];
      if (lastSeen == null) {
        unseen.add(item);
      } else {
        seenWithTimestamp.add(MapEntry(item, lastSeen));
      }
    }

    // 1. Shuffle unseen questions so different users / attempts get varying unseen items
    unseen.shuffle(_random);

    // 2. Sort seen questions by oldest lastSeen timestamp ascending (least recently seen first)
    seenWithTimestamp.sort((a, b) => a.value.compareTo(b.value));
    final List<T> leastRecentlySeen = seenWithTimestamp.map((e) => e.key).toList();

    // 3. Prioritize unseen first, then least-recently-seen
    final List<T> prioritized = [...unseen, ...leastRecentlySeen];

    // Return requested count (or maximum available)
    final count = min(requestedCount, prioritized.length);
    return prioritized.sublist(0, count);
  }
}
