import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/isar_provider.dart';

class ApiKeyDialog extends ConsumerStatefulWidget {
  const ApiKeyDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => const ApiKeyDialog(),
    );
  }

  @override
  ConsumerState<ApiKeyDialog> createState() => _ApiKeyDialogState();
}

class _ApiKeyDialogState extends ConsumerState<ApiKeyDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: ref.read(geminiApiKeyProvider));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentKey = ref.watch(geminiApiKeyProvider);
    final hasKey = currentKey.isNotEmpty;

    return AlertDialog(
      title: Row(
        children: [
          Icon(
            hasKey ? Icons.key_rounded : Icons.key_off_rounded,
            color: hasKey ? Colors.greenAccent : Colors.orangeAccent,
          ),
          const SizedBox(width: 10),
          const Text('Gemini API Key'),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hasKey
                  ? 'Active Key configured (${currentKey.substring(0, (currentKey.length > 8 ? 8 : currentKey.length))}...)'
                  : 'No Gemini key set. You can pass --dart-define=GEMINI_API_KEY=your_key or enter it below. (If omitted, the app uses its built-in curated question bank).',
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter Gemini API Key',
                hintText: 'AIzaSy...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _controller.clear(),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(geminiApiKeyProvider.notifier).state = _controller.text.trim();
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Gemini API Key updated successfully!'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          child: const Text('Save Key'),
        ),
      ],
    );
  }
}
