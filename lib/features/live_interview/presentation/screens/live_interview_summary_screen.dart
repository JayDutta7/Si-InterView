import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:mobileprep_ai/core/theme/app_theme.dart';
import 'package:mobileprep_ai/features/live_interview/data/models/live_interview_session.dart';
import 'package:mobileprep_ai/features/live_interview/domain/models/interview_exchange.dart';
import 'package:mobileprep_ai/features/live_interview/presentation/providers/live_interview_providers.dart';

class LiveInterviewSummaryScreen extends ConsumerWidget {
  final String sessionId;

  const LiveInterviewSummaryScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveSessionsAsync = ref.watch(liveInterviewHistoryStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Interview Summary'),
      ),
      body: liveSessionsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error loading session: $err')),
        data: (sessions) {
          LiveInterviewSession? session;
          for (final s in sessions) {
            if (s.sessionId == sessionId) {
              session = s;
              break;
            }
          }
          session ??= sessions.isNotEmpty ? sessions.first : null;

          if (session == null) {
            return const Center(child: Text('Interview session record not found.'));
          }

          final dateStr = DateFormat('MMM d, y • h:mm a').format(session.startedAt);
          final score = session.overallScore;
          final scoreColor = score >= 7.5
              ? AppTheme.successColor
              : (score >= 5.0 ? AppTheme.warningColor : AppTheme.errorColor);

          // Deserialize transcript
          final List<InterviewExchange> exchanges = session.transcript
              .map((str) => InterviewExchange.deserialize(str))
              .toList();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Overall Rating Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: scoreColor.withValues(alpha: 0.15),
                          border: Border.all(color: scoreColor, width: 3),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          score.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: scoreColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Overall Rating: ${score >= 7.5 ? "Strong Hire / Senior Ready" : (score >= 5.0 ? "Solid Mid-Level Potential" : "Needs Further Preparation")}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${session.topic} (${session.difficulty}) • $dateStr',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Feedback Notes Summary
              const Text(
                'Interviewer Synthesis & Evaluation Notes',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    session.feedbackSummary.isNotEmpty
                        ? session.feedbackSummary
                        : 'No detailed notes recorded.',
                    style: const TextStyle(fontSize: 13, height: 1.45),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Detailed Question & Answer Breakdown
              const Text(
                'Complete Spoken Transcript & Turn Evaluations',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),

              ...exchanges.map((ex) {
                final vColor = ex.verdict == AnswerVerdict.right
                    ? AppTheme.successColor
                    : (ex.verdict == AnswerVerdict.wrong
                        ? AppTheme.errorColor
                        : AppTheme.warningColor);

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Question #${ex.turnIndex}',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: vColor.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: vColor.withValues(alpha: 0.4)),
                              ),
                              child: Text(
                                '${ex.verdict.name.toUpperCase()} • ${ex.score.toStringAsFixed(1)}/10',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: vColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Interviewer: "${ex.question}"',
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Candidate Answer: "${ex.candidateAnswer}"',
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.85),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Evaluation: ${ex.feedback}',
                            style: const TextStyle(fontSize: 12, height: 1.35),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Return to Score Analysis & History'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
