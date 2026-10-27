import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_footer.dart';
import 'pdf_viewer_screen.dart';

class ChapterTopicsScreen extends ConsumerWidget {
  final String unitNumber;
  final String unitTitle;
  final String unitCode;
  final List<Map<String, dynamic>> topics;

  const ChapterTopicsScreen({
    super.key,
    required this.unitNumber,
    required this.unitTitle,
    required this.unitCode,
    required this.topics,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00897B),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          unitTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.menu_book, size: 16),
            label: const Text('Full Notes', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            onPressed: () async {
              final unitInt = int.tryParse(unitNumber.replaceAll(RegExp(r'[^0-9]'), '')) ?? 1;
              final filePath = _unitFiles[unitInt];
              if (filePath != null) {
                try {
                  final fullMd = await rootBundle.loadString(filePath);
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PdfViewerScreen(
                          title: unitTitle,
                          unitTitle: 'Unit $unitNumber ($unitCode)',
                          topicNumber: unitNumber,
                          fileSize: 'Full Chapter',
                          content: fullMd,
                        ),
                      ),
                    );
                  }
                } catch (_) {}
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: topics.length + 1,
        itemBuilder: (context, index) {
          if (index == topics.length) {
            return const Padding(
              padding: EdgeInsets.only(top: 12),
              child: AppFooter(showTopDivider: true),
            );
          }
          final t = topics[index];
          final topicNum = '${index + 1}';
          final title = t['title'] as String;
          final desc = t['description'] as String;
          final fileSize = t['fileSize'] as String? ?? '162.83 KB';

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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left Teal Squircle Badge with Topic Number (Screenshot 3)
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
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00BFA5).withAlpha(40),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    topicNum,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                // Center Topic Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        desc,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            size: 14,
                            color: isDark ? Colors.grey : Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            fileSize,
                            style: TextStyle(
                              fontSize: 11,
                              color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                // Right "Read" Button with Book Icon (Screenshot 3)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F3B36),
                    foregroundColor: const Color(0xFF00BFA5),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Color(0xFF00BFA5), width: 1),
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () async {
                    final unitInt = int.tryParse(unitNumber.replaceAll(RegExp(r'[^0-9]'), '')) ?? 1;
                    final topicIndex = index + 1;
                    final finalContent = await _extractTopicContent(unitInt, topicIndex, title, desc);

                    if (context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PdfViewerScreen(
                            title: '$unitNumber.$topicIndex $title',
                            unitTitle: unitTitle,
                            topicNumber: topicNum,
                            fileSize: fileSize,
                            content: finalContent,
                          ),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.menu_book, size: 16),
                  label: const Text(
                    'Read',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  static const Map<int, String> _unitFiles = {
    1: 'assets/notes/unit_1_basic_concepts.md',
    2: 'assets/notes/unit_2_digital_logic.md',
    3: 'assets/notes/unit_3_c_programming.md',
    4: 'assets/notes/unit_4_computer_organization.md',
    5: 'assets/notes/unit_5_computer_networks.md',
    6: 'assets/notes/unit_6_theory_of_computation.md',
    7: 'assets/notes/unit_7_dsa_dbms_os.md',
    8: 'assets/notes/unit_8_software_engineering.md',
    9: 'assets/notes/unit_9_ai_neural_networks.md',
    10: 'assets/notes/unit_10_nec_regulations_economics.md',
  };

  Future<String> _extractTopicContent(int unitInt, int topicIdx, String title, String desc) async {
    final filePath = _unitFiles[unitInt];
    if (filePath == null) return _getDefaultContent(title, desc);

    try {
      final fullMd = await rootBundle.loadString(filePath);

      // Look for the topic heading, e.g. "## 1.1" or "## 2.3"
      final currentHeaderPattern = RegExp(r'##\s+' + RegExp.escape('$unitInt.$topicIdx'), caseSensitive: false);
      final nextHeaderPattern = RegExp(r'##\s+' + RegExp.escape('$unitInt.${topicIdx + 1}'), caseSensitive: false);

      final currentMatch = currentHeaderPattern.firstMatch(fullMd);
      if (currentMatch != null) {
        final startIndex = currentMatch.start;
        final nextMatch = nextHeaderPattern.firstMatch(fullMd.substring(startIndex + 10));
        if (nextMatch != null) {
          final endIndex = startIndex + 10 + nextMatch.start;
          final extracted = fullMd.substring(startIndex, endIndex).trim();
          if (extracted.length > 100) return extracted;
        } else {
          final extracted = fullMd.substring(startIndex).trim();
          if (extracted.length > 100) return extracted;
        }
      }
      return fullMd; // If individual section split fails, serve the unit's full markdown!
    } catch (_) {
      return _getDefaultContent(title, desc);
    }
  }

  String _getDefaultContent(String title, String desc) {
    return '''# $title
## Overview & Fundamental Definitions
$desc

## Core Principles & High-Yield Syllabus Highlights:
- Structured revision notes covering essential definitions, formulas, and derivations.
- Focus on practical applications and boundary criteria tested in official NEC board licensing exams.
- Sourced directly from official Nepal Engineering Council (NEC) examination references.''';
  }
}
