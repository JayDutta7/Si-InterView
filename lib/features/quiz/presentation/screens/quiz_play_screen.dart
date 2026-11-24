import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mobileprep_ai/core/theme/app_theme.dart';
import 'package:mobileprep_ai/features/adaptive/presentation/providers/adaptive_providers.dart';
import 'package:mobileprep_ai/features/adaptive/presentation/widgets/adaptive_tier_badge.dart';
import 'package:mobileprep_ai/features/performance/presentation/screens/performance_dashboard_screen.dart';
import 'package:mobileprep_ai/features/performance/presentation/widgets/realtime_telemetry_strip.dart';
import 'package:mobileprep_ai/features/quiz/presentation/controllers/quiz_controller.dart';
import 'package:mobileprep_ai/features/quiz/presentation/providers/quiz_providers.dart';
import 'package:mobileprep_ai/features/quiz/presentation/widgets/feedback_card.dart';
import 'package:mobileprep_ai/features/quiz/presentation/widgets/option_card.dart';
import 'package:mobileprep_ai/features/quiz/presentation/screens/quiz_session_review_screen.dart';

class QuizPlayScreen extends ConsumerWidget {
  const QuizPlayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizControllerProvider);
    final controller = ref.read(quizControllerProvider.notifier);

    // If session finished, show summary view
    if (state.isSessionFinished && state.session != null) {
      return _buildSessionCompletedView(context, ref, state);
    }

    final question = state.currentQuestion;
    if (question == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Interview Session')),
        body: const Center(child: Text('No active questions found.')),
      );
    }

    final currentNum = state.currentQuestionIndex + 1;
    final totalNum = state.questions.length;
    final progress = totalNum > 0 ? (currentNum / totalNum) : 0.0;

    return PopScope(
      canPop: state.isSessionFinished,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Quit Interview Session?'),
            content: const Text(
              'Your answered questions are already saved in Isar, but this session will remain incomplete.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Resume'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(ctx, true),
                style: ElevatedButton.styleFrom(backgroundColor: AppTheme.errorColor),
                child: const Text('Quit'),
              ),
            ],
          ),
        );
        if (shouldExit == true && context.mounted) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(state.session?.title ?? 'Interview Session'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$currentNum of $totalNum',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: AppTheme.primaryLight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // Linear Progress Indicator
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryLight),
              minHeight: 4,
            ),

            // Real-Time In-Session Telemetry Strip HUD
            RealtimeTelemetryStrip(
              totalAnswered: state.sessionAnsweredCount,
              correctCount: state.sessionCorrectCount,
              currentAccuracy: state.liveAccuracy,
              avgPaceSeconds: state.liveAvgPaceSeconds,
              optionChanges: state.optionChangesCount,
              onExpand: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PerformanceDashboardScreen(),
                  ),
                );
              },
            ),

            // Live Adaptive Difficulty Badge & Calibration Feedback
            Consumer(
              builder: (context, ref, _) {
                final adaptiveAsync = ref.watch(adaptiveStateFamilyProvider(question.section));
                final adaptiveState = adaptiveAsync.valueOrNull;
                if (adaptiveState == null) return const SizedBox.shrink();
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: AdaptiveTierBadge(state: adaptiveState),
                );
              },
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section & Topic badges
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppTheme.primaryLight.withValues(alpha: 0.3)),
                          ),
                          child: Text(
                            question.section,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryLight,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surfaceContainerHigh,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              question.topic,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Question Text
                    Text(
                      question.questionText,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                        letterSpacing: -0.3,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Options List
                    ...List.generate(question.options.length, (index) {
                      final isSelected = state.selectedOptionIndex == index;
                      final isCorrect = index == question.correctOptionIndex;

                      return OptionCard(
                        index: index,
                        text: question.options[index],
                        isSelected: isSelected,
                        isCorrect: isCorrect,
                        showResult: state.isAnswered,
                        onTap: () => controller.selectOption(index),
                      );
                    }),

                    // Immediate Right/Wrong Feedback Card
                    if (state.isAnswered && state.lastAttempt != null) ...[
                      FeedbackCard(
                        isCorrect: state.lastAttempt!.isCorrect,
                        explanation: question.explanation,
                        responseTimeMs: state.lastAttempt!.responseTimeMs,
                        isLastQuestion: state.isLastQuestion,
                        onNext: () => controller.nextQuestion(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionCompletedView(
    BuildContext context,
    WidgetRef ref,
    QuizPlayState state,
  ) {
    final session = state.session!;
    final scorePercent = session.scorePercent;
    final isPassing = scorePercent >= 70.0;
    final scoreColor = isPassing ? AppTheme.successColor : AppTheme.warningColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview Completed'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Score Circle
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: scoreColor.withValues(alpha: 0.12),
                  border: Border.all(color: scoreColor, width: 4),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${scorePercent.toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: scoreColor,
                      ),
                    ),
                    Text(
                      '${session.correctCount}/${session.totalQuestions} Correct',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Text(
                isPassing ? 'Outstanding Performance!' : 'Practice Makes Perfect!',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                'This session and all question attempts have been persisted to your local Isar database and synced to your live Score Analysis.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),

              const SizedBox(height: 32),

              // View Real-Time Performance Dashboard
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PerformanceDashboardScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.speed_rounded),
                  label: const Text('View Performance Dashboard (9 Metrics)'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Review Session Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizSessionReviewScreen(
                          sessionId: session.sessionId,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.rate_review_outlined),
                  label: const Text('Review Answers & Explanations'),
                ),
              ),

              const SizedBox(height: 12),

              // Done Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
