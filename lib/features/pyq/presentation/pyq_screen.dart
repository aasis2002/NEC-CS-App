import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/animations/nec_animations.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/nec_animated_empty_state.dart';
import '../../../core/widgets/necx_app_bar.dart';
import '../../../core/widgets/necx_drawer.dart';
import '../../../core/widgets/app_footer.dart';
import '../../notes/presentation/pdf_viewer_screen.dart';
import '../../exam/presentation/exam_simulator_screen.dart';
import 'pyq_practice_screen.dart';

class PyqScreen extends ConsumerStatefulWidget {
  const PyqScreen({super.key});

  @override
  ConsumerState<PyqScreen> createState() => _PyqScreenState();
}

class _PyqScreenState extends ConsumerState<PyqScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedYearFilter = 'All';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _authenticSets = [
    {
      'id': 'set_1_2080',
      'sourceType': 'NEC_BOOK_CHAITRA_2080',
      'year': '2080',
      'sessionBadge': 'CHA',
      'title': 'NEC License Exam Set 1 (Chaitra, 2080)',
      'session': 'Session: Chaitra 2080 • Authentic Book Set',
      'fileSize': '0.35MB',
      'date': 'Chaitra 2080',
      'questionsCount': 73,
      'isAuthentic': true,
      'description': '53 Short questions (1 mark) + 20 Long questions (2 marks) exactly from GitBook past archive.',
    },
    {
      'id': 'set_2_2081',
      'sourceType': 'NEC_BOOK_AASADH_2081',
      'year': '2081',
      'sessionBadge': 'ASH',
      'title': 'NEC License Exam Set 2 (Aasadh, 2081)',
      'session': 'Session: Aasadh 2081 • Authentic Book Set',
      'fileSize': '0.38MB',
      'date': 'Aasadh 2081',
      'questionsCount': 76,
      'isAuthentic': true,
      'description': '58 Short questions + 18 Long questions with detailed verified explanations.',
    },
    {
      'id': 'set_3_2080',
      'sourceType': 'NEC_BOOK_ASOJH_2080',
      'year': '2080',
      'sessionBadge': 'ASO',
      'title': 'NEC License Exam Set 3 (Asojh, 2080)',
      'session': 'Session: Asojh 2080 • Authentic Book Set',
      'fileSize': '0.39MB',
      'date': 'Asojh 2080',
      'questionsCount': 79,
      'isAuthentic': true,
      'description': '60 Short questions + 19 Long questions covering all core exam competencies.',
    },
    {
      'id': 'model_set_comp',
      'sourceType': 'NEC_BOOK_MODEL_SET_COMPUTER',
      'year': '2081',
      'sessionBadge': 'CMP',
      'title': 'NEC Official Model Set (Computer Engineering)',
      'session': 'Published by Nepal Engineering Council',
      'fileSize': '0.41MB',
      'date': 'NEC Official 2081',
      'questionsCount': 79,
      'isAuthentic': true,
      'description': 'Standard model paper released by Nepal Engineering Council with solutions.',
    },
    {
      'id': 'model_set_soft',
      'sourceType': 'NEC_BOOK_MODEL_SET_SOFTWARE',
      'year': '2081',
      'sessionBadge': 'SFT',
      'title': 'NEC Official Model Set (Software Engineering)',
      'session': 'Published by Nepal Engineering Council',
      'fileSize': '0.40MB',
      'date': 'NEC Official 2081',
      'questionsCount': 79,
      'isAuthentic': true,
      'description': 'Software Engineering specialization questions directly from the official guide.',
    },
    {
      'id': 'set_ashad_2083',
      'sourceType': 'NEC_BOOK_AASADH_2081',
      'year': '2083',
      'sessionBadge': 'ASH',
      'title': 'NEC License Exam Session 2083 (Ashad)',
      'session': 'Session: Ashad 2083',
      'fileSize': '0.24MB',
      'date': 'Jul 4, 2026',
      'questionsCount': 100,
      'isAuthentic': false,
      'description': 'Full syllabus 100-MCQ session paper conforming to standard NEC blueprints.',
    },
    {
      'id': 'set_chaitra_2082',
      'sourceType': 'NEC_BOOK_CHAITRA_2080',
      'year': '2082',
      'sessionBadge': 'CHA',
      'title': 'NEC License Exam Session 2082 (Chaitra)',
      'session': 'Session: Chaitra 2082',
      'fileSize': '0.22MB',
      'date': 'Apr 11, 2025',
      'questionsCount': 100,
      'isAuthentic': false,
      'description': 'Archive license examination paper with answer key and syllabus citations.',
    },
  ];

  final List<Map<String, dynamic>> _subjectChapters = [
    {
      'unitId': 'unit_1',
      'code': '01',
      'title': 'Basic Electrical & Electronics Engineering',
      'topics': 'DC/AC Circuits, Diodes, BJT, Op-Amps, Transducers',
      'count': 237,
    },
    {
      'unitId': 'unit_2',
      'code': '02',
      'title': 'Digital Logic & Microprocessors',
      'topics': 'Boolean Algebra, Sequential Circuits, 8085/8086, Interrupts',
      'count': 131,
    },
    {
      'unitId': 'unit_3',
      'code': '03',
      'title': 'Programming in C & OOP with C++',
      'topics': 'Pointers, Dynamic Memory, Classes, Polymorphism, Templates',
      'count': 40,
    },
    {
      'unitId': 'unit_4',
      'code': '04',
      'title': 'Computer Organization & Embedded Systems',
      'topics': 'ALU, Control Unit, Cache Mapping, Microcontrollers',
      'count': 53,
    },
    {
      'unitId': 'unit_5',
      'code': '05',
      'title': 'Computer Networks & Network Security',
      'topics': 'OSI Model, TCP/IP, IP Subnetting, Routing, Cryptography',
      'count': 35,
    },
    {
      'unitId': 'unit_6',
      'code': '06',
      'title': 'Theory of Computation & Graphics',
      'topics': 'DFA/NFA, Context-Free Grammars, Turing Machines, 2D/3D Transformations',
      'count': 28,
    },
    {
      'unitId': 'unit_7',
      'code': '07',
      'title': 'Data Structures, DBMS & Operating Systems',
      'topics': 'Trees, Graphs, Sorting, Normalization, SQL, CPU Scheduling',
      'count': 35,
    },
    {
      'unitId': 'unit_8',
      'code': '08',
      'title': 'Software Engineering & OOAD',
      'topics': 'SDLC, Agile, Testing, UML Diagrams, Design Patterns',
      'count': 24,
    },
    {
      'unitId': 'unit_9',
      'code': '09',
      'title': 'Artificial Intelligence & Neural Networks',
      'topics': 'Search Algorithms, Knowledge Representation, MLP, Backpropagation',
      'count': 32,
    },
    {
      'unitId': 'unit_10',
      'code': '10',
      'title': 'Engineering Economics, PM & NEC Regulations',
      'topics': 'Time Value of Money, PERT/CPM, Code of Conduct, NEC Act 2055',
      'count': 107,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _launchPyqPractice({
    required BuildContext context,
    required String title,
    required String subtitle,
    String? sourceType,
    int? year,
    String? unitId,
  }) async {
    final repo = ref.read(repositoryProvider);
    final userId = ref.read(currentUserIdProvider);

    // Show quick loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: AppTheme.primaryTeal),
      ),
    );

    try {
      final questions = await repo.getPyqQuestionsFiltered(
        sourceType: sourceType,
        year: year,
        unitId: unitId,
        userId: userId,
      );

      if (context.mounted) {
        Navigator.pop(context); // Close dialog

        if (questions.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No questions available in this filter.')),
          );
          return;
        }

        Navigator.push(
          context,
          NecAnimations.sharedAxisRoute(
            page: PyqPracticeScreen(
              title: title,
              subtitle: subtitle,
              questions: questions,
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading questions: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const NecAppBar(),
      drawer: const NecDrawer(),
      body: Column(
        children: [
          // 1. Official Hero Banner
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0F3635), Color(0xFF0E252E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF00BFA5).withAlpha(80)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00BFA5).withAlpha(25),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.history_edu, color: Color(0xFF00BFA5), size: 26),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Past Year Questions (PYQs)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Sourced directly from official NEC License Exam Book with full solutions & explanations.',
                          style: TextStyle(
                            color: Colors.white.withAlpha(200),
                            fontSize: 11.5,
                            height: 1.25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 2. Tab Bar: By Year / Exam Set vs By Subject / Chapter
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF161F30) : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppTheme.primaryTeal,
                borderRadius: BorderRadius.circular(12),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              tabs: const [
                Tab(
                  icon: Icon(Icons.date_range, size: 18),
                  text: 'By Year & Exam Set',
                ),
                Tab(
                  icon: Icon(Icons.menu_book, size: 18),
                  text: 'By Subject & Chapter',
                ),
              ],
            ),
          ),

          // 3. Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildYearSetsTab(context, isDark),
                _buildSubjectChaptersTab(context, isDark),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYearSetsTab(BuildContext context, bool isDark) {
    final filteredSets = _authenticSets.where((p) {
      final matchesYear = _selectedYearFilter == 'All' || p['year'] == _selectedYearFilter;
      final matchesSearch = _searchQuery.isEmpty ||
          p['title'].toString().toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p['session'].toString().toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p['year'].toString().contains(_searchQuery);
      return matchesYear && matchesSearch;
    }).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Year Filters & Search
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search exam sets...',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                    prefixIcon: const Icon(Icons.search, size: 20),
                    filled: true,
                    fillColor: isDark ? const Color(0xFF161F30) : Colors.grey.shade100,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (val) => setState(() => _searchQuery = val),
                ),
              ),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: _selectedYearFilter,
                dropdownColor: isDark ? const Color(0xFF161F30) : Colors.white,
                items: ['All', '2083', '2082', '2081', '2080']
                    .map((y) => DropdownMenuItem(value: y, child: Text(y, style: const TextStyle(fontSize: 13))))
                    .toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedYearFilter = val);
                },
              ),
            ],
          ),
          const SizedBox(height: 12),

          if (filteredSets.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: NecAnimatedEmptyState(
                title: 'No Exam Sets Found',
                subtitle: 'No authentic past year sets match your filter.',
                ctaText: 'Reset Filters',
                onCtaPressed: () {
                  _searchController.clear();
                  setState(() {
                    _searchQuery = '';
                    _selectedYearFilter = 'All';
                  });
                },
              ),
            )
          else
            ...filteredSets.asMap().entries.map((entry) {
              final idx = entry.key;
              final paper = entry.value;
              final isAuthentic = paper['isAuthentic'] == true;

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF161F30) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isAuthentic
                        ? const Color(0xFF00BFA5).withAlpha(80)
                        : (isDark ? AppTheme.darkCardBorder : Colors.grey.shade200),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: isAuthentic
                                ? const Color(0xFF00BFA5).withAlpha(30)
                                : const Color(0xFF3B82F6).withAlpha(30),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            paper['sessionBadge'] as String,
                            style: TextStyle(
                              color: isAuthentic ? const Color(0xFF00BFA5) : const Color(0xFF3B82F6),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      paper['title'] as String,
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
                                    ),
                                  ),
                                  if (isAuthentic)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF00BFA5).withAlpha(25),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: const Text(
                                        'BOOK SET',
                                        style: TextStyle(
                                          color: Color(0xFF00BFA5),
                                          fontSize: 9.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '${paper['session']} • ${paper['questionsCount']} Questions',
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
                    const SizedBox(height: 8),
                    Text(
                      paper['description'] as String,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: NecPressable(
                            onTap: () => _launchPyqPractice(
                              context: context,
                              title: paper['title'] as String,
                              subtitle: paper['session'] as String,
                              sourceType: paper['sourceType'] as String?,
                              year: int.tryParse(paper['year'] as String),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryTeal,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.play_arrow_rounded, size: 18, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text(
                                    'Practice MCQs',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        NecPressable(
                          onTap: () {
                            Navigator.push(
                              context,
                              NecAnimations.sharedAxisRoute(
                                page: const ExamSimulatorScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: isDark ? Colors.grey.shade700 : Colors.grey.shade300),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.timer_outlined, size: 16),
                                SizedBox(width: 4),
                                Text('Exam Mode', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.menu_book_outlined, size: 20),
                          tooltip: 'Read Solved Notes',
                          onPressed: () {
                            Navigator.push(
                              context,
                              NecAnimations.sharedAxisRoute(
                                page: PdfViewerScreen(
                                  title: paper['title'] as String,
                                  unitTitle: paper['session'] as String,
                                  topicNumber: paper['year'] as String,
                                  fileSize: paper['fileSize'] as String,
                                  content: '''# ${paper['title']}
## Nepal Engineering Council License Board Examination
- Session: ${paper['session']}
- Verified Question Bank from https://nec-license.gitbook.io/books
- Total Questions: ${paper['questionsCount']}

### Solved Highlights & Key Formulas:
- In AC resonance, reactive power vanishes, leading to unity power factor (cos φ = 1.0).
- TRAP in 8085 is a non-maskable, highest-priority vectored interrupt at memory location 0024H.
- Pure virtual functions in C++ define abstract interfaces that enforce dynamic polymorphism.
- Sliding Window Protocol guarantees end-to-end reliable data delivery with flow control.
- BCNF strictly eliminates all functional dependencies where the determinant is not a superkey.
- A* algorithm with admissible heuristic h(n) <= h*(n) guarantees optimal shortest paths.''',
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ).staggeredEntrance(context: context, index: idx);
            }),
          const SizedBox(height: 12),
          const AppFooter(),
        ],
      ),
    );
  }

  Widget _buildSubjectChaptersTab(BuildContext context, bool isDark) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: _subjectChapters.length + 1,
      itemBuilder: (context, index) {
        if (index == _subjectChapters.length) {
          return const Padding(
            padding: EdgeInsets.only(top: 12),
            child: AppFooter(showTopDivider: true),
          );
        }
        final sub = _subjectChapters[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF161F30) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade200,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00BFA5), Color(0xFF00897B)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      sub['code'] as String,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sub['title'] as String,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${sub['count']} Verified PYQ Items Available',
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
              const SizedBox(height: 8),
              Text(
                'Key Topics: ${sub['topics']}',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.quiz_outlined, size: 18),
                      label: Text('Practice ${sub['title'].toString().split(' ').first} PYQs'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryTeal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () => _launchPyqPractice(
                        context: context,
                        title: sub['title'] as String,
                        subtitle: 'Unit ${sub['code']} Past Year Questions',
                        unitId: sub['unitId'] as String,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
