import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../quiz/presentation/screens/quiz_setup_screen.dart';
import '../providers/performance_providers.dart';
import '../widgets/hero_score_gauge.dart';
import '../widgets/metric_dimension_card.dart';
import '../widgets/session_trend_chart.dart';
import '../widgets/topic_mastery_section_card.dart';

class PerformanceDashboardScreen extends ConsumerWidget {
  const PerformanceDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final performanceAsync = ref.watch(comprehensivePerformanceStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance Dashboard'),
        actions: [
          IconButton(
            tooltip: 'Record Snapshot Checkpoint',
            icon: const Icon(Icons.bookmark_add_outlined),
            onPressed: () async {
              final perf = performanceAsync.valueOrNull;
              if (perf != null) {
                await ref.read(performanceRepositoryProvider).recordSnapshot(
                      performance: perf,
                      source: 'manual_checkpoint',
                    );
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Performance snapshot checkpoint saved to Isar!'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
      body: performanceAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error loading performance metrics: $err')),
        data: (perf) {
          if (perf.totalQuestionsAnswered == 0 && perf.completedSessions == 0) {
            return _buildEmptyState(context);
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // 1. Hero Score Gauge & Readiness Tier
              HeroScoreGauge(
                score: perf.overallScore,
                tier: perf.readinessTier,
                scoreDelta: perf.scoreDelta,
                totalQuestions: perf.totalQuestionsAnswered,
                completedSessions: perf.completedSessions,
              ),

              const SizedBox(height: 24),

              // Section Header: 7 Core Algorithmic Dimensions
              _buildSectionHeader(
                title: 'Core Performance Dimensions',
                subtitle: 'Tap any metric card to inspect formula & contributing factors',
                icon: Icons.hub_rounded,
              ),

              const SizedBox(height: 12),

              // 2. Metric Dimension Cards
              MetricDimensionCard(
                metric: perf.technicalAccuracy,
                icon: Icons.check_circle_rounded,
              ),
              const SizedBox(height: 8),
              MetricDimensionCard(
                metric: perf.knowledgeDepth,
                icon: Icons.psychology_rounded,
              ),
              const SizedBox(height: 8),
              MetricDimensionCard(
                metric: perf.communication,
                icon: Icons.record_voice_over_rounded,
              ),
              const SizedBox(height: 8),
              MetricDimensionCard(
                metric: perf.confidence,
                icon: Icons.bolt_rounded,
              ),
              const SizedBox(height: 8),
              MetricDimensionCard(
                metric: perf.consistency,
                icon: Icons.auto_graph_rounded,
              ),
              const SizedBox(height: 8),
              MetricDimensionCard(
                metric: perf.learningAbility,
                icon: Icons.trending_up_rounded,
              ),
              const SizedBox(height: 8),
              MetricDimensionCard(
                metric: perf.responseTime,
                icon: Icons.speed_rounded,
              ),

              const SizedBox(height: 28),

              // 3. Historical Progression Chart
              _buildSectionHeader(
                title: 'Session Progression',
                subtitle: 'Overall score trajectory across recent runs',
                icon: Icons.stacked_line_chart_rounded,
              ),
              const SizedBox(height: 12),
              SessionTrendChart(scoreHistory: perf.sessionScoreHistory),

              const SizedBox(height: 28),

              // 4. Topic Mastery Breakdown by Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionHeader(
                    title: 'Topic Mastery Breakdown',
                    subtitle: 'Exponential weighting with sample damping',
                    icon: Icons.category_rounded,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Agg: ${perf.topicMasteryAggregate.toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              if (perf.sectionTopicMastery.isEmpty)
                Card(
                  color: const Color(0xFF131C31),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        'No topic mastery stats recorded yet. Complete more questions across different topics.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                  ),
                )
              else
                ...perf.sectionTopicMastery.entries.map(
                  (entry) => TopicMasterySectionCard(
                    sectionName: entry.key,
                    topics: entry.value,
                  ),
                ),

              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: AppTheme.primaryLight),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 11.5, color: Colors.white60),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryLight.withValues(alpha: 0.12),
              ),
              child: const Icon(
                Icons.speed_rounded,
                size: 44,
                color: AppTheme.primaryLight,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'No Performance Data Yet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              'Complete your first technical multiple-choice session or 1-to-1 live interview to begin real-time algorithmic telemetry scoring.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.5,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const QuizSetupScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Start an MCQ Session'),
            ),
          ],
        ),
      ),
    );
  }
}
