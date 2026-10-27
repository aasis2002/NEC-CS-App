import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_footer.dart';
import 'widgets/nec_note_renderer.dart';

class PdfViewerScreen extends ConsumerStatefulWidget {
  final String title;
  final String unitTitle;
  final String topicNumber;
  final String fileSize;
  final String content;

  const PdfViewerScreen({
    super.key,
    required this.title,
    required this.unitTitle,
    required this.topicNumber,
    required this.fileSize,
    required this.content,
  });

  @override
  ConsumerState<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends ConsumerState<PdfViewerScreen> {
  double _zoomScale = 1.0;
  final int _currentPage = 1;
  final int _totalPages = 4;
  bool? _userPdfDarkMode;
  bool _isBookmarked = false;
  final TransformationController _transformationController = TransformationController();

  bool get isPdfDark => _userPdfDarkMode ?? (Theme.of(context).brightness == Brightness.dark);

  void _zoomIn() {
    setState(() {
      _zoomScale = (_zoomScale + 0.25).clamp(0.75, 2.5);
      _transformationController.value = Matrix4.diagonal3Values(_zoomScale, _zoomScale, 1.0);
    });
  }

  void _zoomOut() {
    setState(() {
      _zoomScale = (_zoomScale - 0.25).clamp(0.75, 2.5);
      _transformationController.value = Matrix4.diagonal3Values(_zoomScale, _zoomScale, 1.0);
    });
  }

  void _resetZoom() {
    setState(() {
      _zoomScale = 1.0;
      _transformationController.value = Matrix4.identity();
    });
  }

  @override
  Widget build(BuildContext context) {
    final activePdfDark = isPdfDark;

    final Color pdfBg = activePdfDark ? const Color(0xFF131D2E) : Colors.white;
    final Color pdfTextColor = activePdfDark ? Colors.white : const Color(0xFF1E293B);
    final Color pdfPageBorder = activePdfDark ? const Color(0xFF22354F) : Colors.grey.shade300;

    return Scaffold(
      backgroundColor: activePdfDark ? const Color(0xFF0B0F19) : const Color(0xFFE2E8F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00897B),
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'PDF Document • ${widget.fileSize} • Offline Ready',
              style: const TextStyle(fontSize: 11, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              activePdfDark ? Icons.light_mode : Icons.dark_mode_outlined,
              color: Colors.white,
            ),
            tooltip: activePdfDark ? 'Switch to Light Paper' : 'Switch to Dark Paper',
            onPressed: () {
              setState(() => _userPdfDarkMode = !activePdfDark);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(!activePdfDark ? 'PDF Dark Mode enabled' : 'PDF Light Mode enabled'),
                  duration: const Duration(milliseconds: 900),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: _isBookmarked ? const Color(0xFFFBBF24) : Colors.white,
            ),
            tooltip: 'Bookmark PDF Note',
            onPressed: () {
              setState(() => _isBookmarked = !_isBookmarked);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_isBookmarked ? 'PDF Note bookmarked!' : 'Removed from bookmarks'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Top PDF Document Action Controls Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: activePdfDark ? const Color(0xFF161F30) : Colors.white,
              border: Border(bottom: BorderSide(color: activePdfDark ? AppTheme.darkCardBorder : Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00897B).withAlpha(25),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.picture_as_pdf, color: Color(0xFF00897B), size: 16),
                      const SizedBox(width: 6),
                      Text(
                        'Page $_currentPage of $_totalPages',
                        style: const TextStyle(
                          color: Color(0xFF00897B),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.zoom_out, size: 20),
                  tooltip: 'Zoom Out',
                  onPressed: _zoomOut,
                ),
                Text(
                  '${(_zoomScale * 100).toInt()}%',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                IconButton(
                  icon: const Icon(Icons.zoom_in, size: 20),
                  tooltip: 'Zoom In',
                  onPressed: _zoomIn,
                ),
                IconButton(
                  icon: const Icon(Icons.fit_screen, size: 18),
                  tooltip: 'Fit Page',
                  onPressed: _resetZoom,
                ),
              ],
            ),
          ),

          // PDF Pages Scroll Canvas
          Expanded(
            child: InteractiveViewer(
              transformationController: _transformationController,
              minScale: 0.75,
              maxScale: 3.0,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 680),
                    decoration: BoxDecoration(
                      color: pdfBg,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: pdfPageBorder, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(activePdfDark ? 80 : 30),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Official Document Header Watermark
                        Container(
                          padding: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: const Color(0xFF00897B), width: 2)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00897B).withAlpha(30),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: const Icon(Icons.account_balance, color: Color(0xFF00897B), size: 26),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'NEPAL ENGINEERING COUNCIL (NEC)',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 0.8,
                                        color: Color(0xFF00897B),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Official License Examination Study Notes • Syllabus ACtE',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: activePdfDark ? Colors.grey.shade400 : Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.red.withAlpha(20),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.red.withAlpha(60)),
                                ),
                                child: const Text(
                                  'PDF ARCHIVE',
                                  style: TextStyle(color: Colors.red, fontSize: 9, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Topic Title & Badge
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF00897B),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'SECTION ${widget.topicNumber}',
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                widget.unitTitle,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: activePdfDark ? Colors.grey.shade400 : Colors.grey.shade600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: pdfTextColor,
                            height: 1.25,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Rich, Shared Note Rendering System
                        NecNoteRenderer(
                          markdown: widget.content,
                          unitTitle: widget.unitTitle,
                          topicNumber: widget.topicNumber,
                          isPdfPaperMode: true,
                          forceDarkMode: activePdfDark,
                        ),

                        const SizedBox(height: 36),

                        // PDF Page Footer
                        Container(
                          padding: const EdgeInsets.only(top: 14),
                          decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: pdfPageBorder)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'NEC CS License Preparation • Nepal Engineering Council',
                                  style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Page 1 of $_totalPages',
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // App Footer at bottom of PDF viewer
          const AppFooter(showTopDivider: true),
        ],
      ),
    );
  }
}

