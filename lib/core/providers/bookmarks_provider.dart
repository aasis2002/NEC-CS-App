import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/app_providers.dart';
import '../../features/practice/domain/question_models.dart';

class BookmarksNotifier extends StateNotifier<Set<String>> {
  static const _prefsKey = 'nec_cs_bookmarked_question_ids';

  BookmarksNotifier() : super({}) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_prefsKey) ?? [];
    state = list.toSet();
  }

  Future<void> toggleBookmark(String questionId) async {
    final prefs = await SharedPreferences.getInstance();
    final updated = Set<String>.from(state);
    if (updated.contains(questionId)) {
      updated.remove(questionId);
    } else {
      updated.add(questionId);
    }
    state = updated;
    await prefs.setStringList(_prefsKey, updated.toList());
  }

  bool isBookmarked(String questionId) => state.contains(questionId);
}

final bookmarksProvider = StateNotifierProvider<BookmarksNotifier, Set<String>>((ref) {
  return BookmarksNotifier();
});

final bookmarkedQuestionsFutureProvider = FutureProvider<List<QuestionWithOptions>>((ref) async {
  final bookmarkedIds = ref.watch(bookmarksProvider);
  if (bookmarkedIds.isEmpty) return [];

  final repo = ref.watch(repositoryProvider);
  final allQuestions = await repo.getAllQuestionsWithOptions();
  return allQuestions.where((q) => bookmarkedIds.contains(q.id)).toList();
});
