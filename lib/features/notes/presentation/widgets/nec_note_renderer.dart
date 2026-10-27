import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_theme.dart';

/// Senior-designed, shared note-rendering system for the NEC CS License Preparation App.
///
/// Converts structured notes and Markdown into modern, premium educational components:
/// - Clear heading hierarchy (H1, H2, H3, H4) with teal section badges
/// - Highlighted Definition Boxes with icon badges
/// - Mathematical Formula Cards with variable breakdowns
/// - Responsive, zebra-striped Tables with horizontal scroll
/// - Modern Dark-IDE Code Blocks with syntax display and one-tap Copy
/// - Offline-resilient Technical Diagram Cards with full-screen zoom
/// - High-Yield Exam Tip & Takeaway Callout Cards
/// - Styled Examples and Bullet Points
///
/// Seamlessly adapts to Light and Dark themes, as well as PDF Paper mode.
class NecNoteRenderer extends StatelessWidget {
  final String markdown;
  final String? unitTitle;
  final String? topicNumber;
  final bool isPdfPaperMode;
  final bool? forceDarkMode;

  const NecNoteRenderer({
    super.key,
    required this.markdown,
    this.unitTitle,
    this.topicNumber,
    this.isPdfPaperMode = false,
    this.forceDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = forceDarkMode ?? (theme.brightness == Brightness.dark);
    final blocks = _NoteParser.parse(markdown);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: blocks.map((block) => _buildBlock(context, block, isDark)).toList(),
    );
  }

  Widget _buildBlock(BuildContext context, _NoteBlock block, bool isDark) {
    if (block is _HeaderBlock) {
      return _buildHeader(context, block, isDark);
    } else if (block is _ExamCalloutBlock) {
      return _buildExamCallout(context, block, isDark);
    } else if (block is _DefinitionCardBlock) {
      return _buildDefinitionCard(context, block, isDark);
    } else if (block is _FormulaBlock) {
      return _buildFormulaCard(context, block, isDark);
    } else if (block is _TableBlock) {
      return _buildTable(context, block, isDark);
    } else if (block is _CodeBlock) {
      return _buildCodeBlock(context, block, isDark);
    } else if (block is _DiagramBlock) {
      return _buildDiagramCard(context, block, isDark);
    } else if (block is _ExampleBlock) {
      return _buildExampleCard(context, block, isDark);
    } else if (block is _ListBlock) {
      return _buildList(context, block, isDark);
    } else if (block is _ParagraphBlock) {
      return _buildParagraph(context, block, isDark);
    } else if (block is _DividerBlock) {
      return _buildDivider(isDark);
    }
    return const SizedBox.shrink();
  }

  // --- Headings ---

  Widget _buildHeader(BuildContext context, _HeaderBlock block, bool isDark) {
    final tealColor = isDark ? AppTheme.primaryTeal : const Color(0xFF0D9488);
    final navyText = isDark ? Colors.white : const Color(0xFF0F172A);

    if (block.level == 1) {
      // H1: Document / Chapter Header
      return Container(
        margin: const EdgeInsets.only(top: 8, bottom: 20),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF131D2E) : const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isDark ? const Color(0xFF22324D) : const Color(0xFFCBD5E1),
            width: 1.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: tealColor.withAlpha(isDark ? 50 : 30),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: tealColor.withAlpha(90)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.school_rounded, color: tealColor, size: 14),
                      const SizedBox(width: 5),
                      Text(
                        'NEC SYLLABUS',
                        style: TextStyle(
                          color: tealColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                ),
                if (topicNumber != null) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.withAlpha(isDark ? 40 : 25),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'SEC $topicNumber',
                      style: TextStyle(
                        color: isDark ? Colors.blue.shade300 : Colors.blue.shade700,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 10),
            Text(
              block.text,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
                color: navyText,
                height: 1.3,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
      );
    } else if (block.level == 2) {
      // H2: Topic Section Header (e.g., "1.1 Basic Concepts")
      return Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF162238) : const Color(0xFFE2E8F0).withAlpha(160),
            borderRadius: BorderRadius.circular(10),
            border: Border(
              left: BorderSide(color: tealColor, width: 4),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  block.text,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF0F172A),
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (block.level == 3) {
      // H3: Subtopics / Law / Concept Title (e.g. "1. Ohm's Law")
      return Padding(
        padding: const EdgeInsets.only(top: 18, bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 6,
              height: 18,
              decoration: BoxDecoration(
                color: tealColor,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                block.text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : const Color(0xFF0F2942),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      // H4: Minor Heading / Config
      return Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 6),
        child: Text(
          block.text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: tealColor,
          ),
        ),
      );
    }
  }

  // --- Definition Box ---

  Widget _buildDefinitionCard(BuildContext context, _DefinitionCardBlock block, bool isDark) {
    final tealColor = isDark ? AppTheme.primaryTeal : const Color(0xFF0D9488);
    final cardBg = isDark ? const Color(0xFF111E2E) : const Color(0xFFF0FDFA);
    final borderColor = isDark ? const Color(0xFF1A384C) : const Color(0xFF99F6E4);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: tealColor.withAlpha(isDark ? 15 : 20),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: tealColor.withAlpha(30),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(Icons.menu_book_rounded, color: tealColor, size: 16),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  block.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: tealColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: tealColor.withAlpha(25),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'DEFINITION',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                    color: Color(0xFF00BFA5),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            block.content,
            style: TextStyle(
              fontSize: 13.5,
              height: 1.5,
              color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    );
  }

  // --- Formula Card ---

  Widget _buildFormulaCard(BuildContext context, _FormulaBlock block, bool isDark) {
    final formulaBg = isDark ? const Color(0xFF0F1B2C) : const Color(0xFFF8FAFC);
    final formulaBorder = isDark ? const Color(0xFF23395B) : const Color(0xFFCBD5E1);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: formulaBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: formulaBorder, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withAlpha(isDark ? 40 : 25),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFF3B82F6).withAlpha(80)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.functions_rounded, color: Color(0xFF3B82F6), size: 14),
                    SizedBox(width: 4),
                    Text(
                      'FORMULA',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF3B82F6),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0A121E) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isDark ? const Color(0xFF1E2E48) : Colors.grey.shade200,
              ),
            ),
            child: Text(
              block.formula,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
                color: isDark ? AppTheme.cyanGlow : const Color(0xFF0D9488),
              ),
            ),
          ),
          if (block.variables.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              'Where:',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 4),
            ...block.variables.map(
              (v) => Padding(
                padding: const EdgeInsets.only(left: 6, bottom: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(color: Color(0xFF3B82F6), fontSize: 13, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(
                        v,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.grey.shade300 : const Color(0xFF334155),
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // --- Responsive Table ---

  Widget _buildTable(BuildContext context, _TableBlock block, bool isDark) {
    final headerBg = isDark ? const Color(0xFF0F2636) : const Color(0xFF00897B);
    final borderColor = isDark ? const Color(0xFF22384A) : Colors.grey.shade300;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(headerBg),
          dataRowColor: WidgetStateProperty.resolveWith((states) {
            return null; // Will stripe below
          }),
          headingTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          dataTextStyle: TextStyle(
            fontSize: 12.5,
            color: isDark ? Colors.grey.shade200 : const Color(0xFF1E293B),
          ),
          horizontalMargin: 16,
          columnSpacing: 22,
          border: TableBorder(
            horizontalInside: BorderSide(color: borderColor, width: 0.8),
            verticalInside: BorderSide(color: borderColor, width: 0.8),
          ),
          columns: block.headers.map((h) => DataColumn(label: Text(h))).toList(),
          rows: block.rows.asMap().entries.map((entry) {
            final idx = entry.key;
            final row = entry.value;
            final isEven = idx % 2 == 0;
            final rowBg = isEven
                ? (isDark ? const Color(0xFF131D2E) : Colors.white)
                : (isDark ? const Color(0xFF0D1522) : const Color(0xFFF8FAFC));

            return DataRow(
              color: WidgetStateProperty.all(rowBg),
              cells: row.map((cell) {
                return DataCell(
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 320),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: _formatInlineText(cell, isDark, fontSize: 12.5),
                    ),
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }

  // --- Code Block with Copy ---

  Widget _buildCodeBlock(BuildContext context, _CodeBlock block, bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B131E),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF1E2E42), width: 1.2),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Bar with Language badge and Copy button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF131D2E),
              border: Border(bottom: BorderSide(color: Color(0xFF1E2E42), width: 1)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00BFA5).withAlpha(40),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: const Color(0xFF00BFA5).withAlpha(90)),
                  ),
                  child: Text(
                    block.language.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF00BFA5),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(6),
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: block.code));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Code copied to clipboard!'),
                        duration: const Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.copy_rounded, size: 14, color: Colors.white70),
                        SizedBox(width: 5),
                        Text('Copy', style: TextStyle(color: Colors.white70, fontSize: 11)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Code contents
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16),
            child: Text(
              block.code,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12.5,
                height: 1.45,
                color: Color(0xFFE2E8F0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Technical Diagram Card ---

  Widget _buildDiagramCard(BuildContext context, _DiagramBlock block, bool isDark) {
    final cardBg = isDark ? const Color(0xFF121B2A) : Colors.white;
    final borderColor = isDark ? const Color(0xFF203248) : Colors.grey.shade300;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(isDark ? 50 : 15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Diagram Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            color: isDark ? const Color(0xFF172438) : const Color(0xFFF1F5F9),
            child: Row(
              children: [
                const Icon(Icons.account_tree_outlined, size: 16, color: Color(0xFF00BFA5)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    block.title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00BFA5).withAlpha(25),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'SCHEMATIC',
                    style: TextStyle(color: Color(0xFF00BFA5), fontSize: 9, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          // Image with tap-to-zoom and offline fallback
          GestureDetector(
            onTap: () => _openZoomableImageModal(context, block.imageUrl, block.title),
            child: Image.network(
              block.imageUrl,
              fit: BoxFit.contain,
              height: 200,
              loadingBuilder: (ctx, child, progress) {
                if (progress == null) return child;
                return Container(
                  height: 180,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                );
              },
              errorBuilder: (ctx, error, stackTrace) {
                // High-fidelity offline schematic fallback
                return Container(
                  padding: const EdgeInsets.all(20),
                  color: isDark ? const Color(0xFF0E1624) : const Color(0xFFF8FAFC),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.schema_rounded, size: 40, color: isDark ? Colors.grey.shade600 : Colors.grey.shade400),
                      const SizedBox(height: 8),
                      Text(
                        block.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.grey.shade300 : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Technical Architecture Schematic • Offline Ready',
                        style: TextStyle(fontSize: 11, color: isDark ? Colors.grey.shade500 : Colors.grey.shade600),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _openZoomableImageModal(BuildContext context, String url, String title) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.black.withAlpha(240),
        insetPadding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                minScale: 0.8,
                maxScale: 4.0,
                child: Image.network(
                  url,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Text(
                    'Diagram unavailable offline',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(ctx),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- High-Yield Exam Tip / Takeaway Callout ---

  Widget _buildExamCallout(BuildContext context, _ExamCalloutBlock block, bool isDark) {
    final alertBg = isDark ? const Color(0xFF132238) : const Color(0xFFEFF6FF);
    final alertBorder = isDark ? const Color(0xFF2563EB).withAlpha(120) : const Color(0xFF93C5FD);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: alertBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: alertBorder, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.star_rounded, color: Color(0xFF3B82F6), size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  block.title ?? 'NEC License High-Yield Exam Takeaway',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2563EB),
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _formatInlineText(
            block.text,
            isDark,
            fontSize: 13,
            color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF1E293B),
            height: 1.45,
          ),
        ],
      ),
    );
  }

  // --- Example Card ---

  Widget _buildExampleCard(BuildContext context, _ExampleBlock block, bool isDark) {
    final exampleBg = isDark ? const Color(0xFF1E1C14) : const Color(0xFFFFFBEB);
    final borderColor = isDark ? const Color(0xFF4A3B18) : const Color(0xFFFDE68A);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: exampleBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.lightbulb_rounded, color: Color(0xFFF59E0B), size: 18),
              const SizedBox(width: 8),
              Text(
                block.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD97706),
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _formatInlineText(
            block.content,
            isDark,
            fontSize: 13,
            color: isDark ? const Color(0xFFFDE68A) : const Color(0xFF451A03),
            height: 1.45,
          ),
        ],
      ),
    );
  }

  // --- List Items ---

  Widget _buildList(BuildContext context, _ListBlock block, bool isDark) {
    final tealColor = isDark ? AppTheme.primaryTeal : const Color(0xFF0D9488);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: block.items.asMap().entries.map((entry) {
          final idx = entry.key;
          final item = entry.value;

          return Padding(
            padding: const EdgeInsets.only(bottom: 6, left: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (block.isOrdered)
                  Container(
                    width: 22,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${idx + 1}.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: tealColor,
                      ),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(top: 6, right: 8),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: tealColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                Expanded(
                  child: _formatInlineText(
                    item,
                    isDark,
                    fontSize: 13.5,
                    height: 1.45,
                    color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // --- Paragraph ---

  Widget _buildParagraph(BuildContext context, _ParagraphBlock block, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: _formatInlineText(
        block.text,
        isDark,
        fontSize: 13.5,
        height: 1.5,
        color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF1E293B),
      ),
    );
  }

  Widget _buildDivider(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Divider(
        color: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
        thickness: 1,
      ),
    );
  }

  // --- Inline Rich Text Formatter (Bolds, Code tags, Highlights) ---

  Widget _formatInlineText(
    String raw,
    bool isDark, {
    double fontSize = 13.5,
    Color? color,
    double height = 1.45,
  }) {
    final spans = <InlineSpan>[];
    final regex = RegExp(r'(\*\*[^*]+\*\*|`[^`]+`|\*[^*]+\*)');
    int lastIndex = 0;

    for (final match in regex.allMatches(raw)) {
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: raw.substring(lastIndex, match.start),
          style: TextStyle(
            fontSize: fontSize,
            height: height,
            color: color ?? (isDark ? const Color(0xFFE2E8F0) : const Color(0xFF1E293B)),
          ),
        ));
      }

      final matchedStr = match.group(0)!;
      if (matchedStr.startsWith('**') && matchedStr.endsWith('**')) {
        // Bold
        spans.add(TextSpan(
          text: matchedStr.substring(2, matchedStr.length - 2),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            height: height,
            color: isDark ? Colors.white : const Color(0xFF0F172A),
          ),
        ));
      } else if (matchedStr.startsWith('`') && matchedStr.endsWith('`')) {
        // Inline Code
        spans.add(WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF162234) : const Color(0xFFE2E8F0),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isDark ? const Color(0xFF23354C) : const Color(0xFFCBD5E1),
                width: 0.8,
              ),
            ),
            child: Text(
              matchedStr.substring(1, matchedStr.length - 1),
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: fontSize * 0.9,
                fontWeight: FontWeight.w600,
                color: isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7),
              ),
            ),
          ),
        ));
      } else if (matchedStr.startsWith('*') && matchedStr.endsWith('*')) {
        // Italic
        spans.add(TextSpan(
          text: matchedStr.substring(1, matchedStr.length - 1),
          style: TextStyle(
            fontSize: fontSize,
            fontStyle: FontStyle.italic,
            height: height,
            color: color ?? (isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B)),
          ),
        ));
      }

      lastIndex = match.end;
    }

    if (lastIndex < raw.length) {
      spans.add(TextSpan(
        text: raw.substring(lastIndex),
        style: TextStyle(
          fontSize: fontSize,
          height: height,
          color: color ?? (isDark ? const Color(0xFFE2E8F0) : const Color(0xFF1E293B)),
        ),
      ));
    }

    if (spans.isEmpty) {
      return Text(
        raw,
        style: TextStyle(
          fontSize: fontSize,
          height: height,
          color: color ?? (isDark ? const Color(0xFFE2E8F0) : const Color(0xFF1E293B)),
        ),
      );
    }

    return Text.rich(
      TextSpan(children: spans),
    );
  }
}

// ==========================================
// INTERNAL NOTE BLOCKS & PARSER
// ==========================================

abstract class _NoteBlock {}

class _HeaderBlock extends _NoteBlock {
  final int level;
  final String text;
  _HeaderBlock(this.level, this.text);
}

class _ExamCalloutBlock extends _NoteBlock {
  final String text;
  final String? title;
  _ExamCalloutBlock(this.text, {this.title});
}

class _DefinitionCardBlock extends _NoteBlock {
  final String title;
  final String content;
  _DefinitionCardBlock(this.title, this.content);
}

class _FormulaBlock extends _NoteBlock {
  final String formula;
  final List<String> variables;
  _FormulaBlock(this.formula, this.variables);
}

class _TableBlock extends _NoteBlock {
  final List<String> headers;
  final List<List<String>> rows;
  _TableBlock(this.headers, this.rows);
}

class _CodeBlock extends _NoteBlock {
  final String language;
  final String code;
  _CodeBlock(this.language, this.code);
}

class _DiagramBlock extends _NoteBlock {
  final String title;
  final String imageUrl;
  _DiagramBlock(this.title, this.imageUrl);
}

class _ExampleBlock extends _NoteBlock {
  final String title;
  final String content;
  _ExampleBlock(this.title, this.content);
}

class _ListBlock extends _NoteBlock {
  final bool isOrdered;
  final List<String> items;
  _ListBlock(this.isOrdered, this.items);
}

class _ParagraphBlock extends _NoteBlock {
  final String text;
  _ParagraphBlock(this.text);
}

class _DividerBlock extends _NoteBlock {}

class _NoteParser {
  static List<_NoteBlock> parse(String markdown) {
    final blocks = <_NoteBlock>[];
    final lines = markdown.split(RegExp(r'\r?\n'));
    int i = 0;

    while (i < lines.length) {
      final line = lines[i];
      final trimmed = line.trim();

      if (trimmed.isEmpty) {
        i++;
        continue;
      }

      // 1. Horizontal Rules
      if (trimmed == '***' || trimmed == '---' || trimmed == '___') {
        blocks.add(_DividerBlock());
        i++;
        continue;
      }

      // 2. Headings (#, ##, ###, ####)
      if (trimmed.startsWith('#')) {
        int level = 0;
        while (level < trimmed.length && trimmed[level] == '#') {
          level++;
        }
        final headerText = trimmed.substring(level).trim();
        blocks.add(_HeaderBlock(level, headerText));
        i++;
        continue;
      }

      // 3. Blockquotes / Exam Weightage
      if (trimmed.startsWith('>')) {
        final quoteText = trimmed.substring(1).trim();
        if (quoteText.toLowerCase().contains('exam weightage') || quoteText.toLowerCase().contains('marks')) {
          blocks.add(_ExamCalloutBlock(quoteText, title: 'NEC Board Exam Weightage'));
        } else {
          blocks.add(_ExamCalloutBlock(quoteText));
        }
        i++;
        continue;
      }

      // 4. Code Blocks (```lang ... ```)
      if (trimmed.startsWith('```')) {
        final lang = trimmed.substring(3).trim();
        final codeLines = <String>[];
        i++;
        while (i < lines.length && !lines[i].trim().startsWith('```')) {
          codeLines.add(lines[i]);
          i++;
        }
        if (i < lines.length) i++; // skip closing ```
        blocks.add(_CodeBlock(lang.isEmpty ? 'code' : lang, codeLines.join('\n')));
        continue;
      }

      // 5. Diagrams / Images: ![alt](url)
      final imgMatch = RegExp(r'^!\[(.*?)\]\((.*?)\)$').firstMatch(trimmed);
      if (imgMatch != null) {
        final title = imgMatch.group(1)?.trim();
        final url = imgMatch.group(2)?.trim() ?? '';
        blocks.add(_DiagramBlock(
          (title == null || title.isEmpty) ? 'Technical Schematic Diagram' : title,
          url,
        ));
        i++;
        continue;
      }

      // 6. Tables (| col 1 | col 2 |)
      if (trimmed.startsWith('|') && trimmed.endsWith('|')) {
        final tableLines = <String>[];
        while (i < lines.length && lines[i].trim().startsWith('|')) {
          tableLines.add(lines[i].trim());
          i++;
        }

        if (tableLines.length >= 2) {
          // Parse header
          final headerCols = tableLines[0]
              .split('|')
              .map((c) => c.trim())
              .where((c) => c.isNotEmpty)
              .toList();

          // Skip separator row (tableLines[1])
          final rows = <List<String>>[];
          for (int r = 2; r < tableLines.length; r++) {
            final rowCols = tableLines[r]
                .split('|')
                .map((c) => c.trim())
                .where((c) => c.isNotEmpty)
                .toList();
            if (rowCols.isNotEmpty) {
              rows.add(rowCols);
            }
          }

          if (headerCols.isNotEmpty) {
            blocks.add(_TableBlock(headerCols, rows));
            continue;
          }
        }
      }

      // 7. Formula Detection (e.g. Mathematically: \n * V=I×R \n Where: ...)
      if (trimmed.toLowerCase().startsWith('mathematically:') ||
          (trimmed.startsWith('* ') && (trimmed.contains('=') && (trimmed.contains('×') || trimmed.contains('/') || trimmed.contains('+') || trimmed.contains('-') || trimmed.contains('*'))))) {
        String formula = '';
        if (trimmed.toLowerCase().startsWith('mathematically:')) {
          i++;
          if (i < lines.length) {
            formula = lines[i].trim().replaceAll(RegExp(r'^[\*\-]\s*'), '');
            i++;
          }
        } else {
          formula = trimmed.replaceAll(RegExp(r'^[\*\-]\s*'), '');
          i++;
        }

        final vars = <String>[];
        if (i < lines.length && lines[i].trim().toLowerCase().startsWith('where:')) {
          i++;
          while (i < lines.length && (lines[i].trim().startsWith('* ') || lines[i].trim().startsWith('- '))) {
            vars.add(lines[i].trim().substring(2).trim());
            i++;
          }
        }

        if (formula.isNotEmpty) {
          blocks.add(_FormulaBlock(formula, vars));
          continue;
        }
      }

      // 8. Definition Card Detection (e.g. "Ohm’s Law states that..." or "Electric current is...")
      if (trimmed.toLowerCase().contains('states that') ||
          trimmed.toLowerCase().contains('is defined as') ||
          trimmed.toLowerCase().contains('is the potential difference') ||
          trimmed.toLowerCase().contains('is the rate at which')) {
        // Check if preceding line or current line has a bold concept
        final boldMatch = RegExp(r'\*\*([^*]+)\*\*').firstMatch(trimmed);
        final title = boldMatch != null ? boldMatch.group(1)! : 'Fundamental Concept';
        blocks.add(_DefinitionCardBlock(title, trimmed));
        i++;
        continue;
      }

      // 9. Examples (e.g. "**Example:**" or "Example: ...")
      if (trimmed.toLowerCase().startsWith('**example') || trimmed.toLowerCase().startsWith('example:')) {
        final title = 'Practical Example';
        final content = trimmed.replaceFirst(RegExp(r'^\*?\*?example:?\*?\*?:?\s*', caseSensitive: false), '');
        blocks.add(_ExampleBlock(title, content.isEmpty ? trimmed : content));
        i++;
        continue;
      }

      // 10. Key Points / Exam Takeaway
      if (trimmed.toLowerCase().startsWith('**key point') || trimmed.toLowerCase().startsWith('key point:')) {
        final content = trimmed.replaceFirst(RegExp(r'^\*?\*?key point:?\*?\*?:?\s*', caseSensitive: false), '');
        blocks.add(_ExamCalloutBlock(content.isEmpty ? trimmed : content, title: 'Key Board Exam Takeaway'));
        i++;
        continue;
      }

      // 11. Lists (Ordered or Unordered)
      if (trimmed.startsWith('* ') || trimmed.startsWith('- ') || RegExp(r'^[0-9]+\.\s').hasMatch(trimmed)) {
        final isOrdered = RegExp(r'^[0-9]+\.\s').hasMatch(trimmed);
        final items = <String>[];

        while (i < lines.length) {
          final l = lines[i].trim();
          if (isOrdered && RegExp(r'^[0-9]+\.\s').hasMatch(l)) {
            items.add(l.replaceFirst(RegExp(r'^[0-9]+\.\s*'), ''));
            i++;
          } else if (!isOrdered && (l.startsWith('* ') || l.startsWith('- '))) {
            items.add(l.substring(2).trim());
            i++;
          } else {
            break;
          }
        }

        if (items.isNotEmpty) {
          blocks.add(_ListBlock(isOrdered, items));
          continue;
        }
      }

      // 12. Standard Paragraph
      blocks.add(_ParagraphBlock(trimmed));
      i++;
    }

    return blocks;
  }
}
