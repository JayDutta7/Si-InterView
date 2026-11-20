import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:mobileprep_ai/core/theme/app_theme.dart';
import 'package:mobileprep_ai/features/quiz/presentation/providers/quiz_providers.dart';

class QuizSessionReviewScreen extends ConsumerWidget {
  final String sessionId;

  const QuizSessionReviewScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(singleQuizSessionStreamProvider(sessionId));
    final attemptsAsync = ref.watch(sessionAttemptsStreamProvider(sessionId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Session Review'),
      ),
      body: sessionAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error loading session: $err')),
        data: (session) {
          if (session == null) {
            return const Center(child: Text('Session record not found.'));
          }

          final dateStr = DateFormat('MMM d, y • h:mm a').format(session.startedAt);
          final isPassing = session.scorePercent >= 70.0;
          final scoreColor = isPassing ? AppTheme.successColor : AppTheme.warningColor;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Header Summary Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Container(
                        width: 68,
                        height: 68,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: scoreColor.withValues(alpha: 0.12),
                          border: Border.all(color: scoreColor, width: 2.5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${session.scorePercent.toStringAsFixed(0)}%',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: scoreColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              session.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              dateStr,
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                _buildBadge(
                                  context,
                                  session.difficulty,
                                  AppTheme.primaryLight,
                                ),
                                const SizedBox(width: 8),
                                _buildBadge(
                                  context,
                                  '${session.correctCount}/${session.totalQuestions} Correct',
                                  scoreColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Questions & Detailed Explanations',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 10),

              // Question Attempts List
              attemptsAsync.when(
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (err, _) => Text('Error loading attempts: $err'),
                data: (attempts) {
                  if (attempts.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(child: Text('No recorded attempts for this session.')),
                    );
                  }

                  return Column(
                    children: List.generate(attempts.length, (index) {
                      final attempt = attempts[index];
                      final isCorrect = attempt.isCorrect;
                      final statusColor = isCorrect ? AppTheme.successColor : AppTheme.errorColor;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 14),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Top Tag: Question Number and Section
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: statusColor.withValues(alpha: 0.2),
                                    child: Icon(
                                      isCorrect ? Icons.check : Icons.close,
                                      size: 15,
                                      color: statusColor,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Question ${index + 1}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: statusColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    attempt.topic,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.6),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              // Question Text
                              Text(
                                attempt.questionText,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  height: 1.35,
                                ),
                              ),

                              const SizedBox(height: 12),

                              // Options
                              ...List.generate(attempt.options.length, (optIdx) {
                                final optText = attempt.options[optIdx];
                                final isSelected = attempt.selectedIndex == optIdx;
                                final isAnsCorrect = attempt.correctIndex == optIdx;

                                Color optBg = Colors.transparent;
                                Color optBorder = Theme.of(context).colorScheme.outlineVariant;
                                Widget? icon;

                                if (isAnsCorrect) {
                                  optBg = AppTheme.successColor.withValues(alpha: 0.12);
                                  optBorder = AppTheme.successColor;
                                  icon = const Icon(
                                    Icons.check_circle_rounded,
                                    color: AppTheme.successColor,
                                    size: 18,
                                  );
                                } else if (isSelected && !isAnsCorrect) {
                                  optBg = AppTheme.errorColor.withValues(alpha: 0.12);
                                  optBorder = AppTheme.errorColor;
                                  icon = const Icon(
                                    Icons.cancel_rounded,
                                    color: AppTheme.errorColor,
                                    size: 18,
                                  );
                                }

                                return Container(
                                  margin: const EdgeInsets.only(bottom: 6),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: optBg,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: optBorder, width: isAnsCorrect || isSelected ? 1.5 : 0.8),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          optText,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: isAnsCorrect || isSelected
                                                ? FontWeight.w600
                                                : FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      if (icon != null) icon,
                                    ],
                                  ),
                                );
                              }),

                              const SizedBox(height: 10),

                              // Explanation Box
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Explanation:',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      attempt.explanation,
                                      style: TextStyle(
                                        fontSize: 12.5,
                                        height: 1.4,
                                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.85),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBadge(BuildContext context, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
