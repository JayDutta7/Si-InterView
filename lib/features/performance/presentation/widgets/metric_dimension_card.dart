import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/services/performance_scoring_engine.dart';
import 'metric_detail_sheet.dart';

class MetricDimensionCard extends StatelessWidget {
  final MetricBreakdown metric;
  final IconData icon;

  const MetricDimensionCard({
    super.key,
    required this.metric,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final color = metric.score >= 80.0
        ? AppTheme.successColor
        : (metric.score >= 60.0
            ? AppTheme.primaryLight
            : (metric.score >= 40.0 ? AppTheme.warningColor : AppTheme.errorColor));

    return Card(
      elevation: 0,
      color: const Color(0xFF131C31),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFF334155), width: 1.2),
      ),
      child: InkWell(
        onTap: () => MetricDetailSheet.show(context, metric),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: Icon, Name, and Score
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, size: 18, color: color),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          metric.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Weight: ${(metric.weight * 100).toInt()}%',
                          style: TextStyle(
                            fontSize: 11,
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        metric.score.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: color,
                        ),
                      ),
                      const Row(
                        children: [
                          Text(
                            'Inspect',
                            style: TextStyle(fontSize: 10.5, color: Colors.white54),
                          ),
                          Icon(Icons.chevron_right, size: 12, color: Colors.white54),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Linear progress indicator
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: (metric.score / 100.0).clamp(0.0, 1.0),
                  backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  minHeight: 6,
                ),
              ),

              if (metric.secondaryMetric != null) ...[
                const SizedBox(height: 8),
                Text(
                  metric.secondaryMetric!,
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
