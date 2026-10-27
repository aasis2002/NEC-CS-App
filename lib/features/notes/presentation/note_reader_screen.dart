import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/database/app_database.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_footer.dart';
import 'widgets/nec_note_renderer.dart';

class NoteReaderScreen extends ConsumerStatefulWidget {
  final Note note;
  final String unitTitle;

  const NoteReaderScreen({
    super.key,
    required this.note,
    required this.unitTitle,
  });

  @override
  ConsumerState<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends ConsumerState<NoteReaderScreen> {
  String _markdownContent = '';
  bool _isLoading = true;
  late bool _isCompleted;
  late bool _isBookmarked;

  @override
  void initState() {
    super.initState();
    _isCompleted = widget.note.isCompleted;
    _isBookmarked = widget.note.isBookmarked;
    _loadNoteMarkdown();
  }

  Future<void> _loadNoteMarkdown() async {
    try {
      final content = await rootBundle.loadString(widget.note.filePath);
      if (mounted) {
        setState(() {
          _markdownContent = content;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _markdownContent = '# ${widget.note.title}\n\n*Content could not be loaded from ${widget.note.filePath}.*';
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _toggleCompleted() async {
    final newState = !_isCompleted;
    setState(() => _isCompleted = newState);
    await ref.read(repositoryProvider).toggleNoteCompleted(widget.note.id, newState);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(newState ? 'Marked as completed! Readiness score updated.' : 'Marked as incomplete.'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _toggleBookmarked() async {
    final newState = !_isBookmarked;
    setState(() => _isBookmarked = newState);
    await ref.read(repositoryProvider).toggleNoteBookmarked(widget.note.id, newState);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.unitTitle,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
              color: _isBookmarked ? AppTheme.accentAmber : null,
            ),
            tooltip: 'Bookmark',
            onPressed: _toggleBookmarked,
          ),
          IconButton(
            icon: Icon(
              _isCompleted ? Icons.check_circle : Icons.check_circle_outline,
              color: _isCompleted ? AppTheme.successGreen : null,
            ),
            tooltip: 'Mark as completed',
            onPressed: _toggleCompleted,
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkSurface : Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.withAlpha(40))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.offline_pin, size: 16, color: AppTheme.successGreen),
                  const SizedBox(width: 6),
                  Text(
                    'Offline Cached • ~${widget.note.estimatedReadMinutes} min read',
                    style: TextStyle(fontSize: 12, color: isDark ? Colors.grey.shade400 : Colors.grey.shade600),
                  ),
                ],
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isCompleted ? Colors.grey.shade700 : AppTheme.successGreen,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                icon: Icon(_isCompleted ? Icons.check : Icons.done_all, size: 16),
                label: Text(_isCompleted ? 'Completed' : 'Mark Done'),
                onPressed: _toggleCompleted,
              ),
            ],
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NecNoteRenderer(
                    markdown: _markdownContent,
                    unitTitle: widget.unitTitle,
                  ),
                  const SizedBox(height: 32),
                  const AppFooter(),
                ],
              ),
            ),
    );
  }
}

