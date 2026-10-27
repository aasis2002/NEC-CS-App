import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

void showSyllabusModal(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  final units = [
    {
      'num': '01',
      'title': 'Concept of Basic Electrical and Electronics Engineering',
      'qs': '10 Qs',
      'topics': ['Basic Concept (Ohm\'s Law, KCL/KVL, Star-Delta)', 'Network Theorems (Superposition, Thevenin, Norton)', 'AC Fundamentals & 3-Phase Systems', 'Semiconductor Devices & Diode Applications', 'Signal Generators & Oscillators', 'Amplifiers & Op-Amps']
    },
    {
      'num': '02',
      'title': 'Digital Logic and Microprocessor',
      'qs': '10 Qs',
      'topics': ['Number Systems & Boolean Algebra', 'Combinational & Arithmetic Circuits', 'Sequential Logic (Flip-Flops, Registers)', '8085/8086 Microprocessor Architecture', 'Microprocessor System & Interfacing (8255 PPI)', 'Interrupt Operations & Priority']
    },
    {
      'num': '03',
      'title': 'Programming Language and Its Applications',
      'qs': '10 Qs',
      'topics': ['C Language Fundamentals & Control Flow', 'Pointers, Structures & File Handling in C', 'C++ Classes & Objects', 'OOP Features & Operator Overloading', 'Virtual Functions & Polymorphism', 'Templates, STL & Exception Handling']
    },
    {
      'num': '04',
      'title': 'Computer Organization and Embedded System',
      'qs': '10 Qs',
      'topics': ['Basic Computer Architecture & Addressing', 'Control Unit & ALU Design', 'Memory Hierarchy & Cache Mapping', 'Input/Output Organization & DMA', 'Embedded Systems & Microcontrollers', 'Real-Time Operating Systems (RTOS)']
    },
    {
      'num': '05',
      'title': 'Computer Network and Network Security',
      'qs': '10 Qs',
      'topics': ['OSI & TCP/IP Reference Models', 'Data Link Layer & MAC Protocols', 'Network Layer, IPv4/IPv6 & CIDR Subnetting', 'Transport Layer (TCP, UDP, Flow Control)', 'Application Layer Protocols (DNS, HTTP)', 'Network Security, RSA, Firewalls & VPN']
    },
    {
      'num': '06',
      'title': 'Theory of Computation and Computer Graphics',
      'qs': '10 Qs',
      'topics': ['Deterministic & Non-deterministic Finite Automata', 'Regular Expressions & Pumping Lemma', 'Context-Free Grammars & Pushdown Automata', 'Turing Machines & Computability', '2D/3D Affine Transformations & Projections', 'Clipping Algorithms (Cohen-Sutherland) & Shading']
    },
    {
      'num': '07',
      'title': 'Data Structures, DBMS and Operating System',
      'qs': '10 Qs',
      'topics': ['Arrays, Stacks, Queues, Linked Lists', 'Trees (AVL, B-Trees) & Graphs (Dijkstra)', 'Sorting & Searching Algorithms', 'Relational Database Design & Normalization (1NF-BCNF)', 'Transaction Processing & ACID Properties', 'Process Management, Deadlocks & Memory Paging']
    },
    {
      'num': '08',
      'title': 'Software Engineering and Object Oriented Analysis',
      'qs': '10 Qs',
      'topics': ['Software Development Life Cycles (Waterfall, Agile)', 'Software Requirements Engineering', 'Software Testing & Quality Assurance', 'Object-Oriented Design & Design Patterns', 'UML Structural & Behavioral Modeling', 'Software Project Metrics & CMMI']
    },
    {
      'num': '09',
      'title': 'Artificial Intelligence and Neural Networks',
      'qs': '10 Qs',
      'topics': ['State Space Search & A* Heuristic Algorithm', 'Adversarial Search & Alpha-Beta Pruning', 'Knowledge Representation & Propositional Logic', 'Expert Systems & Inference Engines', 'Artificial Neural Networks & Perceptron Learning', 'Backpropagation & Deep Learning Foundations']
    },
    {
      'num': '10',
      'title': 'Engineering Economics and NEC Regulations',
      'qs': '10 Qs',
      'topics': ['Time Value of Money & Cash Flow Analysis', 'Present Worth, Future Worth & Annuities', 'Net Present Value (NPV) & Internal Rate of Return (IRR)', 'Project Management (CPM/PERT Critical Path)', 'Nepal Engineering Council (NEC) Act 2055', 'Professional Ethics & Code of Conduct']
    },
  ];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: isDark ? AppTheme.darkSurface : Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) => DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      expand: false,
      builder: (_, scrollController) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(80),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryTeal.withAlpha(25),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.assignment, color: AppTheme.primaryTeal, size: 24),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Official NEC Syllabus (ACtE)',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        '10 Units • 100 Questions • 100 Marks Total',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(ctx),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: units.length,
              itemBuilder: (context, i) {
                final u = units[i];
                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    color: isDark ? AppTheme.darkCard : Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isDark ? AppTheme.darkCardBorder : Colors.grey.shade200,
                    ),
                  ),
                  child: ExpansionTile(
                    shape: const Border(),
                    leading: Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryTeal.withAlpha(30),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        u['num'] as String,
                        style: const TextStyle(
                          color: AppTheme.primaryTeal,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    title: Text(
                      u['title'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    subtitle: Text(
                      'Weightage: ${u['qs']}',
                      style: const TextStyle(fontSize: 11, color: AppTheme.primaryTeal),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(),
                            const Text(
                              'Prescribed Syllabus Topics:',
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            ...(u['topics'] as List<String>).map((t) => Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('• ', style: TextStyle(color: AppTheme.primaryTeal)),
                                      Expanded(
                                        child: Text(
                                          t,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: isDark ? Colors.grey.shade300 : Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
