import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:mobileprep_ai/core/theme/app_theme.dart';
import 'package:mobileprep_ai/features/quiz/presentation/screens/quiz_session_review_screen.dart';
import 'package:mobileprep_ai/features/quiz/presentation/screens/quiz_setup_screen.dart';
import 'package:mobileprep_ai/features/live_interview/presentation/providers/live_interview_providers.dart';
import 'package:mobileprep_ai/features/live_interview/presentation/screens/live_interview_summary_screen.dart';
import 'package:mobileprep_ai/features/performance/presentation/screens/performance_dashboard_screen.dart';
import 'package:mobileprep_ai/features/analytics/data/analytics_isar_datasource.dart';
import 'package:mobileprep_ai/features/analytics/presentation/providers/analytics_providers.dart';

class ScoreAnalysisScreen extends ConsumerWidget {
  const ScoreAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsAsync = ref.watch(overallAnalyticsStreamProvider);
    final sessionsAsync = ref.watch(allSessionsHistoryStreamProvider);
    final liveSessionsAsync = ref.watch(liveInterviewHistoryStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Analysis & History'),
      ),
      body: analyticsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error loading stats: $err')),
        data: (stats) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Real-Time 9-Metric Performance Dashboard Banner
              Card(
                color: AppTheme.primaryLight.withValues(alpha: 0.12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: AppTheme.primaryLight, width: 1.2),
                ),
                child: ListTile(
                  leading: const Icon(Icons.speed_rounded, color: AppTheme.primaryLight, size: 28),
                  title: const Text(
                    'Real-Time Performance Dashboard',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.5),
                  ),
                  subtitle: const Text(
                    'Inspect 9 Algorithmic Dimensions & Readiness Tier',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PerformanceDashboardScreen(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // 1. Overall Accuracy & Metrics Cards
              _buildOverallMetricsCard(context, stats),

              const SizedBox(height: 20),

              // 2. Section-wise Accuracy Breakdown
              _buildSectionBreakdownCard(context, stats),

              const SizedBox(height: 20),

              // 3. Weakest Topics & One-Tap Targeted Practice
              _buildWeakestTopicsCard(context, ref, stats),

              const SizedBox(height: 20),

              // 4. Past Quiz Sessions History
              _buildPastSessionsHeader(context),
              const SizedBox(height: 10),
              _buildPastSessionsList(context, sessionsAsync),

              const SizedBox(height: 20),

              // 5. Past Live Camera & Voice Interview Sessions
              _buildLiveInterviewSessionsSection(context, liveSessionsAsync),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOverallMetricsCard(BuildContext context, OverallAnalytics stats) {
    final accuracyColor = stats.overallAccuracy >= 70
        ? AppTheme.successColor
        : (stats.overallAccuracy >= 50 ? AppTheme.warningColor : AppTheme.errorColor);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.insights_rounded,
                  color: AppTheme.primaryLight,
                  size: 22,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Live Isar Performance Analytics',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppTheme.successColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Reactive Watcher',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.successColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  context,
                  '${stats.overallAccuracy.toStringAsFixed(1)}%',
                  'Overall Accuracy',
                  accuracyColor,
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
                _buildStatItem(
                  context,
                  '${stats.totalQuestionsAnswered}',
                  'Questions Solved',
                  AppTheme.primaryLight,
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
                _buildStatItem(
                  context,
                  '${stats.completedSessionsCount}',
                  'Completed Sets',
                  AppTheme.secondaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String value,
    String label,
    Color color,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionBreakdownCard(
    BuildContext context,
    OverallAnalytics stats,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Section-Wise Accuracy Breakdown',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 14),
            if (stats.sectionBreakdown.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'No section data yet. Complete an interview session to see your breakdown.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              )
            else
              ...stats.sectionBreakdown.map((sec) {
                final ratio = sec.totalAttempts > 0 ? (sec.accuracy / 100.0) : 0.0;
                final color = sec.accuracy >= 70
                    ? AppTheme.successColor
                    : (sec.accuracy >= 50 ? AppTheme.warningColor : AppTheme.errorColor);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              sec.section,
                              style: const TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            '${sec.accuracy.toStringAsFixed(0)}% (${sec.correctAttempts}/${sec.totalAttempts})',
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w700,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: ratio,
                          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
                          valueColor: AlwaysStoppedAnimation<Color>(color),
                          minHeight: 6,
                        ),
                      ),
                    ],
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }

  Widget _buildWeakestTopicsCard(
    BuildContext context,
    WidgetRef ref,
    OverallAnalytics stats,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.trending_down_rounded,
                  color: AppTheme.errorColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Targeted Practice: Weakest Topics',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (stats.weakestTopics.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Great job! No weak topics detected yet. Keep testing your skills.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              )
            else
              ...stats.weakestTopics.map((topic) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHigh.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              topic.topic,
                              style: const TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${topic.section} • ${topic.accuracy.toStringAsFixed(0)}% accuracy (${topic.correctAttempts}/${topic.totalAttempts})',
                              style: TextStyle(
                                fontSize: 11.5,
                                color: topic.accuracy < 50
                                    ? AppTheme.errorColor
                                    : AppTheme.warningColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuizSetupScreen(
                                initialSections: [topic.section],
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        child: const Text('Practice'),
                      ),
                    ],
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }

  Widget _buildPastSessionsHeader(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.history_rounded, size: 20),
        SizedBox(width: 8),
        Text(
          'Quiz Sessions History',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildPastSessionsList(
    BuildContext context,
    AsyncValue<List<dynamic>> sessionsAsync,
  ) {
    return sessionsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Text('Error loading sessions: $err'),
      data: (sessions) {
        if (sessions.isEmpty) {
          return const Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text('No quiz sessions recorded yet. Start your first session!'),
              ),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sessions.length,
          itemBuilder: (context, index) {
            final session = sessions[index];
            final dateStr = DateFormat('MMM d, h:mm a').format(session.startedAt);
            final scoreColor = session.scorePercent >= 70
                ? AppTheme.successColor
                : (session.scorePercent >= 50 ? AppTheme.warningColor : AppTheme.errorColor);

            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizSessionReviewScreen(
                        sessionId: session.sessionId,
                      ),
                    ),
                  );
                },
                leading: CircleAvatar(
                  backgroundColor: scoreColor.withValues(alpha: 0.15),
                  child: Text(
                    '${session.scorePercent.toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: scoreColor,
                    ),
                  ),
                ),
                title: Text(
                  session.title,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                subtitle: Text(
                  '$dateStr • ${session.correctCount}/${session.totalQuestions} Correct',
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildLiveInterviewSessionsSection(
    BuildContext context,
    AsyncValue<List<dynamic>> liveSessionsAsync,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.video_camera_front_rounded, size: 20),
            SizedBox(width: 8),
            Text(
              '1-to-1 Live Interview Sessions',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        liveSessionsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Text('Error loading live sessions: $err'),
          data: (sessions) {
            if (sessions.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text('No spoken live interview sessions recorded yet.'),
                  ),
                ),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                final session = sessions[index];
                final dateStr = DateFormat('MMM d, h:mm a').format(session.startedAt);

                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LiveInterviewSummaryScreen(
                            sessionId: session.sessionId,
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.secondaryColor.withValues(alpha: 0.15),
                      child: Text(
                        '${session.overallScore.toStringAsFixed(1)}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.secondaryColor,
                        ),
                      ),
                    ),
                    title: Text(
                      '${session.topic} (${session.difficulty})',
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    subtitle: Text(
                      '$dateStr • ${session.totalExchanges} Questions Answered',
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
