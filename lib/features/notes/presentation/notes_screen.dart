import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/animations/nec_animations.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/necx_app_bar.dart';
import '../../../core/widgets/necx_drawer.dart';
import '../../../core/widgets/app_footer.dart';
import '../../../core/widgets/nec_animated_empty_state.dart';
import 'chapter_topics_screen.dart';

class NotesScreen extends ConsumerStatefulWidget {
  final String? preselectedUnitId;

  const NotesScreen({super.key, this.preselectedUnitId});

  @override
  ConsumerState<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _unitsData = [
    {
      'id': 'unit_1',
      'unitNumber': '01',
      'code': 'AExE01',
      'title': 'Basic Electrical and Electronics Engineering',
      'desc': 'DC/AC circuits, network theorems, semiconductor devices, signal generators, amplifiers.',
      'pdfCount': 6,
      'totalSize': '1.2 MB',
      'topics': [
        {
          'title': 'Basic concept',
          'description': 'Basic concepts, Fundamental Electrical Laws and Units',
          'fileSize': '162.83 KB',
        },
        {
          'title': 'Network theorems',
          'description': 'concept of superposition theorem, Thevenin\'s theore...',
          'fileSize': '162.42 KB',
        },
        {
          'title': 'Alternating current fundamentals',
          'description': ': Principle of generation of alternating voltages and curr...',
          'fileSize': '166.08 KB',
        },
        {
          'title': 'Semiconductor devices',
          'description': 'Semiconductor diode and its characteristics',
          'fileSize': '126.21 KB',
        },
        {
          'title': 'Signal generator',
          'description': 'Basic Principles of Oscillator, RC, LC and Crystal Oscillator...',
          'fileSize': '147.33 KB',
        },
        {
          'title': 'Amplifiers',
          'description': 'Classification of Output Stages, Class A Output Stag...',
          'fileSize': '155.10 KB',
        },
      ],
    },
    {
      'id': 'unit_2',
      'unitNumber': '02',
      'code': 'AExE02',
      'title': 'Digital Logic and Microprocessor',
      'desc': 'Boolean algebra, combinational & sequential circuits, 8085/8086 microprocessor, interfacing.',
      'pdfCount': 6,
      'totalSize': '1.1 MB',
      'topics': [
        {'title': 'Number Systems and Boolean Algebra', 'description': 'Base conversions, De Morgan\'s theorems, K-Maps', 'fileSize': '158.20 KB'},
        {'title': 'Combinational Logic Circuits', 'description': 'Multiplexers, decoders, encoders, adders, subtractors', 'fileSize': '164.12 KB'},
        {'title': 'Sequential Logic and Flip-Flops', 'description': 'SR, JK, D, T flip-flops, master-slave, race around', 'fileSize': '149.80 KB'},
        {'title': '8085 Microprocessor Architecture', 'description': 'Bus structure, registers, ALU, timing and control', 'fileSize': '175.40 KB'},
        {'title': '8085/8086 Assembly Programming', 'description': 'Addressing modes, instruction sets, stack operations', 'fileSize': '162.30 KB'},
        {'title': 'Peripheral Interfacing and Interrupts', 'description': '8255 PPI, vector interrupt priority, DMA', 'fileSize': '151.70 KB'},
      ],
    },
    {
      'id': 'unit_3',
      'unitNumber': '03',
      'code': 'ACtE03',
      'title': 'Programming Language and Its Applications',
      'desc': 'C programming constructs, pointers, dynamic memory, C++ OOP, virtual functions, STL.',
      'pdfCount': 6,
      'totalSize': '1.0 MB',
      'topics': [
        {'title': 'C Language Fundamentals', 'description': 'Control structures, loops, arrays, strings, functions', 'fileSize': '142.10 KB'},
        {'title': 'Pointers and Dynamic Memory', 'description': 'Pointer arithmetic, malloc/calloc/free, dangling pointers', 'fileSize': '155.60 KB'},
        {'title': 'C++ Object-Oriented Programming', 'description': 'Classes, objects, constructors, destructors, this pointer', 'fileSize': '160.25 KB'},
        {'title': 'Inheritance and Polymorphism', 'description': 'Access specifiers, virtual functions, abstract classes', 'fileSize': '168.40 KB'},
        {'title': 'Operator Overloading and Templates', 'description': 'Function/class templates, stream I/O overloading', 'fileSize': '145.80 KB'},
        {'title': 'Standard Template Library (STL)', 'description': 'Vectors, maps, sets, algorithms, iterators, exceptions', 'fileSize': '170.15 KB'},
      ],
    },
    {
      'id': 'unit_4',
      'unitNumber': '04',
      'code': 'ACtE04',
      'title': 'Computer Organization and Embedded System',
      'desc': 'ALU & Control Unit, memory hierarchy, cache mapping, pipelining, embedded microcontrollers.',
      'pdfCount': 6,
      'totalSize': '1.1 MB',
      'topics': [
        {'title': 'Computer Architecture Foundations', 'description': 'Von Neumann vs Harvard, instruction formats, RISC/CISC', 'fileSize': '152.00 KB'},
        {'title': 'Control Unit and Pipelining', 'description': 'Hardwired vs microprogrammed, hazards, branch prediction', 'fileSize': '166.30 KB'},
        {'title': 'Memory Hierarchy and Cache Design', 'description': 'Direct, associative mapping, cache misses, write policies', 'fileSize': '172.80 KB'},
        {'title': 'I/O Organization and DMA', 'description': 'Programmed I/O, interrupt-driven, cycle stealing DMA', 'fileSize': '148.50 KB'},
        {'title': 'Embedded Microcontrollers', 'description': 'Architecture, timers, PWM, GPIO, ADC/DAC interfacing', 'fileSize': '158.40 KB'},
        {'title': 'Real-Time Operating Systems (RTOS)', 'description': 'Task scheduling, priority inversion, rate monotonic', 'fileSize': '144.20 KB'},
      ],
    },
    {
      'id': 'unit_5',
      'unitNumber': '05',
      'code': 'ACtE05',
      'title': 'Computer Network and Network Security',
      'desc': 'OSI & TCP/IP models, CIDR subnetting, routing protocols, cryptography, firewalls.',
      'pdfCount': 6,
      'totalSize': '1.3 MB',
      'topics': [
        {'title': 'OSI and TCP/IP Reference Models', 'description': '7 layers functions, encapsulation, PDUs, standards', 'fileSize': '160.00 KB'},
        {'title': 'Data Link Layer and MAC Protocols', 'description': 'Framing, error detection CRC, sliding window, CSMA/CD', 'fileSize': '154.20 KB'},
        {'title': 'IPv4/IPv6 Addressing and Subnetting', 'description': 'CIDR prefixes, usable hosts calculation, VLSM design', 'fileSize': '182.50 KB'},
        {'title': 'Routing Protocols', 'description': 'Distance vector Bellman-Ford, link state Dijkstra OSPF', 'fileSize': '168.00 KB'},
        {'title': 'Transport Protocols (TCP/UDP)', 'description': 'Three-way handshake, flow control, congestion avoidance', 'fileSize': '174.10 KB'},
        {'title': 'Network Security and Cryptography', 'description': 'RSA, AES, digital signatures, SSL/TLS, firewalls, VPN', 'fileSize': '185.30 KB'},
      ],
    },
    {
      'id': 'unit_6',
      'unitNumber': '06',
      'code': 'ACtE06',
      'title': 'Theory of Computation and Computer Graphics',
      'desc': 'Automata theory, regular expressions, Turing machines, 2D/3D graphics transformations.',
      'pdfCount': 6,
      'totalSize': '1.1 MB',
      'topics': [
        {'title': 'Finite State Automata', 'description': 'DFA, NFA equivalence, minimization, regular expressions', 'fileSize': '159.20 KB'},
        {'title': 'Context-Free Languages and Grammars', 'description': 'CFG, pushdown automata, ambiguity, Chomsky normal form', 'fileSize': '163.50 KB'},
        {'title': 'Turing Machines and Decidability', 'description': 'Halting problem, undecidability, P vs NP classes', 'fileSize': '155.80 KB'},
        {'title': '2D/3D Affine Transformations', 'description': 'Translation, rotation, scaling homogeneous matrices', 'fileSize': '171.40 KB'},
        {'title': 'Scan Conversion and Line Algorithms', 'description': 'Bresenham line and circle algorithms, DDA', 'fileSize': '148.90 KB'},
        {'title': 'Clipping and Shading', 'description': 'Cohen-Sutherland outcodes, Sutherland-Hodgman, Gouraud', 'fileSize': '162.10 KB'},
      ],
    },
    {
      'id': 'unit_7',
      'unitNumber': '07',
      'code': 'ACtE07',
      'title': 'Data Structures, DBMS and Operating System',
      'desc': 'Trees, graphs, complexity, normalization 1NF-BCNF, transactions, process scheduling, deadlocks.',
      'pdfCount': 6,
      'totalSize': '1.4 MB',
      'topics': [
        {'title': 'Linear and Non-Linear Data Structures', 'description': 'Stacks, queues, linked lists, AVL balance factors', 'fileSize': '176.40 KB'},
        {'title': 'Sorting, Searching and Graph Algorithms', 'description': 'QuickSort, MergeSort, BFS, DFS, Dijkstra shortest path', 'fileSize': '185.10 KB'},
        {'title': 'Relational Model and Normalization', 'description': 'Keys, functional dependencies, 1NF, 2NF, 3NF, BCNF', 'fileSize': '190.20 KB'},
        {'title': 'Transaction Management and ACID', 'description': 'Serializability, two-phase locking (2PL), recovery', 'fileSize': '168.90 KB'},
        {'title': 'CPU Scheduling and Synchronization', 'description': 'FCFS, SJF, Round Robin, semaphores, mutexes', 'fileSize': '172.50 KB'},
        {'title': 'Deadlocks and Memory Paging', 'description': 'Coffman conditions, Banker\'s algorithm, virtual memory', 'fileSize': '180.30 KB'},
      ],
    },
    {
      'id': 'unit_8',
      'unitNumber': '08',
      'code': 'ACtE08',
      'title': 'Software Engineering and Object Oriented Analysis',
      'desc': 'SDLC models, testing techniques, UML structural/behavioral diagrams, software metrics, CMMI.',
      'pdfCount': 6,
      'totalSize': '1.0 MB',
      'topics': [
        {'title': 'Software Development Life Cycles', 'description': 'Waterfall, V-Model, Spiral risk management, Agile Scrum', 'fileSize': '155.00 KB'},
        {'title': 'Requirements Engineering and SRS', 'description': 'Functional vs non-functional requirements, IEEE 830', 'fileSize': '142.80 KB'},
        {'title': 'Software Testing Techniques', 'description': 'Black-box boundary value, white-box basis path, cyclomatic', 'fileSize': '164.20 KB'},
        {'title': 'Object-Oriented Design and Patterns', 'description': 'Coupling, cohesion, Creational/Structural/Behavioral', 'fileSize': '158.70 KB'},
        {'title': 'UML Modeling Diagrams', 'description': 'Class, Sequence, Use Case, State Machine diagrams', 'fileSize': '162.40 KB'},
        {'title': 'Software Quality and CMMI', 'description': 'CMMI 5 levels, ISO 9001, software maintenance types', 'fileSize': '149.30 KB'},
      ],
    },
    {
      'id': 'unit_9',
      'unitNumber': '09',
      'code': 'ACtE09',
      'title': 'Artificial Intelligence and Neural Networks',
      'desc': 'A* search, Minimax, alpha-beta pruning, knowledge representation, perceptron, backpropagation.',
      'pdfCount': 6,
      'totalSize': '1.1 MB',
      'topics': [
        {'title': 'Search Algorithms and Heuristics', 'description': 'BFS, DFS, A* admissible heuristic rules, IDA*', 'fileSize': '165.40 KB'},
        {'title': 'Adversarial Game Playing', 'description': 'Minimax search, alpha-beta cutoff condition alpha >= beta', 'fileSize': '152.80 KB'},
        {'title': 'Knowledge Representation and Logic', 'description': 'Propositional logic, predicate calculus, resolution refutation', 'fileSize': '159.90 KB'},
        {'title': 'Expert Systems and Inference', 'description': 'Forward vs backward chaining, rule-based systems', 'fileSize': '147.60 KB'},
        {'title': 'Perceptrons and Linear Separability', 'description': 'Single-layer perceptron, XOR limitation, activations', 'fileSize': '168.10 KB'},
        {'title': 'Multi-Layer Perceptrons and Backpropagation', 'description': 'Gradient descent, loss functions, learning rate, momentum', 'fileSize': '176.50 KB'},
      ],
    },
    {
      'id': 'unit_10',
      'unitNumber': '10',
      'code': 'ACtE10',
      'title': 'Engineering Economics and NEC Regulations',
      'desc': 'NPV, IRR, CPM/PERT project management, Nepal Engineering Council Act 2055, ethics.',
      'pdfCount': 6,
      'totalSize': '1.2 MB',
      'topics': [
        {'title': 'Engineering Economics Foundations', 'description': 'Time value of money, cash flow diagrams, compound interest', 'fileSize': '162.00 KB'},
        {'title': 'Project Evaluation Techniques', 'description': 'NPV, IRR discount rate where NPV=0, Payback, B/C ratio', 'fileSize': '174.50 KB'},
        {'title': 'CPM and Network Analysis', 'description': 'Activity on node, forward/backward pass, zero total float', 'fileSize': '180.20 KB'},
        {'title': 'PERT Probabilistic Scheduling', 'description': 'Three-time estimates to, tm, tp, expected time Te=(to+4tm+tp)/6', 'fileSize': '168.40 KB'},
        {'title': 'Nepal Engineering Council Act 2055', 'description': 'NEC statutory mandate, Category A/B/C registration, licensing', 'fileSize': '184.90 KB'},
        {'title': 'Engineering Ethics and Procurement', 'description': 'Code of conduct, Public Procurement Act 2063 tendering rules', 'fileSize': '165.70 KB'},
      ],
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final filteredUnits = _unitsData.where((u) {
      if (_searchQuery.isEmpty) return true;
      final q = _searchQuery.toLowerCase();
      final title = (u['title'] as String).toLowerCase();
      final desc = (u['desc'] as String).toLowerCase();
      final num = u['unitNumber'] as String;
      return title.contains(q) || desc.contains(q) || num.contains(q);
    }).toList();

    return Scaffold(
      appBar: const NecAppBar(),
      drawer: const NecDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section Header
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Chapter Notes & PDF Study Documents',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF161F30) : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade300),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search chapters, topics, formulas...',
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

            // Chapters List or Animated Empty State
            if (filteredUnits.isEmpty)
              NecAnimatedEmptyState(
                title: 'No Matching Chapters Found',
                subtitle: 'Try searching for another keyword, syllabus code (e.g. ACtE03), or topic title.',
                fallbackIcon: Icons.search_off_rounded,
                buttonText: 'Clear Search',
                onButtonPressed: () {
                  _searchController.clear();
                  setState(() => _searchQuery = '');
                },
              )
            else
              ...filteredUnits.asMap().entries.map((entry) {
                final index = entry.key;
                final u = entry.value;

                return NecPressable(
                  onTap: () {
                    Navigator.push(
                      context,
                      NecAnimations.sharedAxisRoute(
                        page: ChapterTopicsScreen(
                          unitNumber: u['unitNumber'] as String,
                          unitTitle: u['title'] as String,
                          unitCode: u['code'] as String,
                          topics: List<Map<String, dynamic>>.from(u['topics'] as List),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF161F30) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(isDark ? 30 : 8),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF00BFA5), Color(0xFF00897B)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  u['unitNumber'] as String,
                                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      u['title'] as String,
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      '${u['pdfCount']} PDF Topics • ${u['totalSize']}',
                                      style: const TextStyle(fontSize: 12, color: Color(0xFF00BFA5), fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.chevron_right, color: Color(0xFF00BFA5)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            u['desc'] as String,
                            style: TextStyle(
                              fontSize: 12,
                              color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00BFA5).withAlpha(20),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.picture_as_pdf, size: 12, color: Color(0xFF00BFA5)),
                                    SizedBox(width: 4),
                                    Text(
                                      'PDF Format',
                                      style: TextStyle(color: Color(0xFF00BFA5), fontSize: 10, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withAlpha(25),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  u['code'] as String,
                                  style: TextStyle(
                                    color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                'Open Topics →',
                                style: TextStyle(color: Color(0xFF00BFA5), fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ).staggeredEntrance(context: context, index: index);
              }),
            const SizedBox(height: 12),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
