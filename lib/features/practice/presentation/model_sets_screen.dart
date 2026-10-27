import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/animations/nec_animations.dart';
import '../../../core/services/question_generator_service.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/nec_animated_empty_state.dart';
import '../../../core/widgets/nec_animated_loading.dart';
import '../../exam/presentation/exam_simulator_screen.dart';

class ModelSetsScreen extends ConsumerStatefulWidget {
  const ModelSetsScreen({super.key});

  @override
  ConsumerState<ModelSetsScreen> createState() => _ModelSetsScreenState();
}

class _ModelSetsScreenState extends ConsumerState<ModelSetsScreen> {
  String _selectedFilter = 'All';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _modelSets = List.generate(29, (index) {
    final setNum = index + 1;
    final String setStr = setNum.toString().padLeft(2, '0');
    final String difficulty = setNum % 4 == 0
        ? 'Hard'
        : (setNum % 3 == 0 ? 'Med-Hard' : (setNum % 2 == 0 ? 'Easy' : 'Medium'));
    final int qCount = setNum == 1 ? 100 : (setNum == 2 ? 50 : (setNum == 3 ? 38 : (setNum % 2 == 0 ? 50 : 100)));
    final int duration = (qCount * 1.2).round();

    return {
      'setNumber': setNum,
      'setStr': setStr,
      'title': 'Full Syllabus Mock Test - Set $setNum',
      'subtitle': 'Comprehensive test covering all topics',
      'questionsCount': qCount,
      'durationMinutes': duration,
      'difficulty': difficulty,
    };
  });

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final filteredSets = _modelSets.where((s) {
      final matchesFilter = _selectedFilter == 'All' ||
          s['difficulty'].toString().toLowerCase().contains(_selectedFilter.toLowerCase());
      final matchesQuery = _searchQuery.isEmpty ||
          s['title'].toString().toLowerCase().contains(_searchQuery.toLowerCase()) ||
          s['setStr'].toString().contains(_searchQuery);
      return matchesFilter && matchesQuery;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Practice Model Sets',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'NEC License Exam Pattern',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Simulated Exam Practice Banner (Screenshot 5)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF142E5E), Color(0xFF0F1E38)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF2563EB).withAlpha(80)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2563EB).withAlpha(40),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.timer_outlined, color: Color(0xFF60A5FA), size: 28),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Simulated Exam Practice',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Complete full-length model questions following official NEC scoring criteria.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 2. Search Bar
            Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF161F30) : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade300,
                ),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search model sets by title or set number...',
                  hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, size: 20, color: Colors.grey),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 18),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                onChanged: (val) => setState(() => _searchQuery = val.trim()),
              ),
            ),

            const SizedBox(height: 16),

            // 3. Filter Chips: All, Easy, Medium, Hard
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'Easy', 'Medium', 'Hard'].map((filter) {
                  final isSelected = _selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      selected: isSelected,
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isSelected) ...[
                            const Icon(Icons.check, size: 16, color: Colors.white),
                            const SizedBox(width: 4),
                          ],
                          Text(filter),
                        ],
                      ),
                      selectedColor: const Color(0xFF2563EB),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : (isDark ? Colors.grey.shade300 : Colors.black87),
                      ),
                      backgroundColor: isDark ? const Color(0xFF161F30) : Colors.grey.shade200,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      onSelected: (_) => setState(() => _selectedFilter = filter),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            // 4. Sets Count Text
            Text(
              '${filteredSets.length} model sets available',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 12),

            // 5. Model Set Cards List / Empty State
            if (filteredSets.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: NecAnimatedEmptyState(
                  title: 'No Model Sets Found',
                  subtitle: 'No sets match your current search or difficulty filter.',
                  ctaText: 'Reset Filters',
                  onCtaPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                      _selectedFilter = 'All';
                    });
                  },
                ),
              )
            else
              ...filteredSets.asMap().entries.map((entry) {
                final idx = entry.key;
                final s = entry.value;
                final String diff = s['difficulty'];
                Color diffBg = Colors.grey.withAlpha(30);
                Color diffFg = Colors.grey;

                if (diff == 'Easy') {
                  diffBg = AppTheme.successGreen.withAlpha(30);
                  diffFg = AppTheme.successGreen;
                } else if (diff == 'Medium') {
                  diffBg = AppTheme.accentAmber.withAlpha(30);
                  diffFg = AppTheme.accentAmber;
                } else if (diff == 'Med-Hard' || diff == 'Hard') {
                  diffBg = AppTheme.errorRed.withAlpha(30);
                  diffFg = AppTheme.errorRed;
                }

                Future<void> startSet() async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const Center(
                      child: NecAnimatedLoading(message: 'Generating Model Set questions...'),
                    ),
                  );

                  final questions = await QuestionGeneratorService.generateModelSetAsync(
                    setNumber: s['setNumber'] as int,
                    count: s['questionsCount'] as int,
                  );

                  if (context.mounted) {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      NecAnimations.sharedAxisRoute(
                        page: ExamSimulatorScreen(
                          preloadedQuestions: questions,
                        ),
                      ),
                    );
                  }
                }

                return NecPressable(
                  onTap: startSet,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF161F30) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade200,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(isDark ? 30 : 8),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left Blue Squircle SET Badge
                            Container(
                              width: 54,
                              height: 54,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF3B82F6).withAlpha(50),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'SET',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  Text(
                                    s['setStr'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 14),
                            // Center Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    s['title'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    s['subtitle'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        // Bottom Metadata Row & Start Button
                        Row(
                          children: [
                            Icon(Icons.assignment_outlined, size: 16, color: isDark ? Colors.grey : Colors.grey.shade700),
                            const SizedBox(width: 4),
                            Text(
                              '${s['questionsCount']} Qs',
                              style: TextStyle(fontSize: 12, color: isDark ? Colors.grey.shade300 : Colors.grey.shade700),
                            ),
                            const SizedBox(width: 12),
                            Icon(Icons.schedule, size: 16, color: isDark ? Colors.grey : Colors.grey.shade700),
                            const SizedBox(width: 4),
                            Text(
                              '${s['durationMinutes']}m',
                              style: TextStyle(fontSize: 12, color: isDark ? Colors.grey.shade300 : Colors.grey.shade700),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: diffBg,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                diff,
                                style: TextStyle(color: diffFg, fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1D4ED8),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF1D4ED8).withAlpha(40),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Start', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
                                  SizedBox(width: 4),
                                  Icon(Icons.arrow_forward, size: 14, color: Colors.white),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).staggeredEntrance(context: context, index: idx);
              }),
          ],
        ),
      ),
    );
  }
}
