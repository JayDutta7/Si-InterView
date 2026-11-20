import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mobileprep_ai/core/constants/app_constants.dart';
import 'package:mobileprep_ai/core/database/isar_provider.dart';
import 'package:mobileprep_ai/core/theme/app_theme.dart';
import 'package:mobileprep_ai/core/widgets/api_key_dialog.dart';
import 'package:mobileprep_ai/features/quiz/data/models/question_record.dart';
import 'package:mobileprep_ai/features/quiz/presentation/providers/quiz_providers.dart';
import 'package:mobileprep_ai/features/quiz/presentation/screens/quiz_play_screen.dart';

class QuizSetupScreen extends ConsumerStatefulWidget {
  final List<String>? initialSections;
  final String? initialDifficulty;

  const QuizSetupScreen({
    super.key,
    this.initialSections,
    this.initialDifficulty,
  });

  @override
  ConsumerState<QuizSetupScreen> createState() => _QuizSetupScreenState();
}

class _QuizSetupScreenState extends ConsumerState<QuizSetupScreen> {
  late List<String> _selectedSections;
  late String _selectedDifficulty;
  int _selectedCount = 5;

  @override
  void initState() {
    super.initState();
    _selectedSections = widget.initialSections ?? [AppConstants.sectionMixed];
    _selectedDifficulty = widget.initialDifficulty ?? AppConstants.difficultySenior;
  }

  void _toggleSection(String section) {
    setState(() {
      if (section == AppConstants.sectionMixed) {
        _selectedSections = [AppConstants.sectionMixed];
        return;
      }

      _selectedSections.remove(AppConstants.sectionMixed);
      if (_selectedSections.contains(section)) {
        if (_selectedSections.length > 1) {
          _selectedSections.remove(section);
        }
      } else {
        _selectedSections.add(section);
      }
      if (_selectedSections.isEmpty) {
        _selectedSections = [AppConstants.sectionMixed];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(quizControllerProvider);
    final isar = ref.watch(isarProvider);
    final apiKey = ref.watch(geminiApiKeyProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Interview Session'),
        actions: [
          IconButton(
            tooltip: 'Gemini API Key',
            icon: Icon(
              apiKey.isNotEmpty ? Icons.key_rounded : Icons.key_off_rounded,
              color: apiKey.isNotEmpty ? AppTheme.successColor : Colors.amber,
            ),
            onPressed: () => ApiKeyDialog.show(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Anti-Repeat Isar Status Card
            FutureBuilder<int>(
              future: isar.questionRecords.count(),
              builder: (context, snapshot) {
                final seenCount = snapshot.data ?? 0;
                return Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: AppTheme.secondaryColor.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.shield_outlined,
                        color: AppTheme.secondaryColor,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Anti-Repeat Engine Active (Isar v3)',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.secondaryColor,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '$seenCount unique question hashes tracked in Isar. Duplicate questions are filtered automatically across all sessions.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // Section Selection
            _buildSectionHeader('1. Select Interview Section(s)'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 10,
              children: AppConstants.selectableSections.map((sec) {
                final isSelected = _selectedSections.contains(sec);
                return FilterChip(
                  label: Text(sec),
                  selected: isSelected,
                  onSelected: (_) => _toggleSection(sec),
                  selectedColor: AppTheme.primaryColor.withValues(alpha: 0.25),
                  checkmarkColor: AppTheme.primaryLight,
                  side: BorderSide(
                    color: isSelected ? AppTheme.primaryLight : const Color(0xFF334155),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 26),

            // Difficulty Selection
            _buildSectionHeader('2. Target Seniority Level'),
            const SizedBox(height: 10),
            Row(
              children: AppConstants.difficulties.map((diff) {
                final isSelected = _selectedDifficulty == diff;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Center(
                        child: Text(
                          diff,
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          ),
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (val) {
                        if (val) setState(() => _selectedDifficulty = diff);
                      },
                      selectedColor: AppTheme.primaryColor.withValues(alpha: 0.25),
                      side: BorderSide(
                        color: isSelected ? AppTheme.primaryLight : const Color(0xFF334155),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 26),

            // Question Count Selection
            _buildSectionHeader('3. Number of Questions'),
            const SizedBox(height: 10),
            Row(
              children: AppConstants.questionCounts.map((count) {
                final isSelected = _selectedCount == count;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Center(
                        child: Text(
                          '$count Questions',
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          ),
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (val) {
                        if (val) setState(() => _selectedCount = count);
                      },
                      selectedColor: AppTheme.primaryColor.withValues(alpha: 0.25),
                      side: BorderSide(
                        color: isSelected ? AppTheme.primaryLight : const Color(0xFF334155),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 36),

            if (quizState.errorMessage != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppTheme.errorColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.errorColor.withValues(alpha: 0.3)),
                ),
                child: Text(
                  quizState.errorMessage!,
                  style: const TextStyle(color: AppTheme.errorColor, fontSize: 13),
                ),
              ),
            ],

            // Start Button
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: quizState.isLoading
                    ? null
                    : () async {
                        final nav = Navigator.of(context);
                        await ref.read(quizControllerProvider.notifier).startQuiz(
                              sections: _selectedSections,
                              difficulty: _selectedDifficulty,
                              count: _selectedCount,
                            );

                        if (mounted && ref.read(quizControllerProvider).session != null) {
                          nav.push(
                            MaterialPageRoute(
                              builder: (_) => const QuizPlayScreen(),
                            ),
                          );
                        }
                      },
                icon: quizState.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.play_arrow_rounded, size: 26),
                label: Text(
                  quizState.isLoading ? 'Generating Questions...' : 'Start Interview Session',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
      ),
    );
  }
}
