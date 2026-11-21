import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/services/performance_scoring_engine.dart';

class HeroScoreGauge extends StatelessWidget {
  final double score;
  final ReadinessTier tier;
  final double scoreDelta;
  final int totalQuestions;
  final int completedSessions;

  const HeroScoreGauge({
    super.key,
    required this.score,
    required this.tier,
    required this.scoreDelta,
    required this.totalQuestions,
    required this.completedSessions,
  });

  @override
  Widget build(BuildContext context) {
    Color tierColor;
    switch (tier) {
      case ReadinessTier.seniorLeadStrong:
        tierColor = AppTheme.successColor;
        break;
      case ReadinessTier.interviewReady:
        tierColor = AppTheme.primaryLight;
        break;
      case ReadinessTier.developing:
        tierColor = AppTheme.warningColor;
        break;
      case ReadinessTier.foundational:
        tierColor = const Color(0xFF94A3B8);
        break;
    }

    final hasDelta = scoreDelta != 0.0;
    final isDeltaPositive = scoreDelta > 0;
    final deltaColor = isDeltaPositive ? AppTheme.successColor : AppTheme.errorColor;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF131C31),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF334155), width: 1.5),
        gradient: LinearGradient(
          colors: [
            const Color(0xFF131C31),
            tierColor.withValues(alpha: 0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.stars_rounded, color: AppTheme.secondaryColor, size: 22),
                  const SizedBox(width: 8),
                  const Text(
                    'Overall Readiness Index',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              // Live delta badge
              if (hasDelta)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: deltaColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: deltaColor.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isDeltaPositive ? Icons.trending_up_rounded : Icons.trending_down_rounded,
                        size: 14,
                        color: deltaColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${isDeltaPositive ? "+" : ""}${scoreDelta.toStringAsFixed(1)} pts',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: deltaColor,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),

          const SizedBox(height: 20),

          // Central Circular Gauge
          SizedBox(
            width: 140,
            height: 140,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 140,
                  height: 140,
                  child: CircularProgressIndicator(
                    value: (score / 100.0).clamp(0.0, 1.0),
                    strokeWidth: 10,
                    backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
                    valueColor: AlwaysStoppedAnimation<Color>(tierColor),
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      score.toStringAsFixed(0),
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1,
                        color: tierColor,
                      ),
                    ),
                    Text(
                      '/ 100',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Readiness Tier Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: tierColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: tierColor.withValues(alpha: 0.4), width: 1.5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.verified_rounded, size: 16, color: tierColor),
                const SizedBox(width: 8),
                Text(
                  tier.label.toUpperCase(),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                    color: tierColor,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          Text(
            tier.subtitle,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),

          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 12),

          // Bottom stats counters
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMiniMetric(context, '$totalQuestions', 'Questions Solved'),
              Container(width: 1, height: 28, color: Colors.white12),
              _buildMiniMetric(context, '$completedSessions', 'Completed Sets'),
              Container(width: 1, height: 28, color: Colors.white12),
              _buildMiniMetric(context, '9 Metrics', 'Scoring Model'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiniMetric(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
