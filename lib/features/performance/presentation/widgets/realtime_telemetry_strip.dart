import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class RealtimeTelemetryStrip extends StatelessWidget {
  final int totalAnswered;
  final int correctCount;
  final double currentAccuracy;
  final double avgPaceSeconds;
  final int optionChanges;
  final String statusText;
  final VoidCallback? onExpand;

  const RealtimeTelemetryStrip({
    super.key,
    required this.totalAnswered,
    required this.correctCount,
    required this.currentAccuracy,
    required this.avgPaceSeconds,
    this.optionChanges = 0,
    this.statusText = 'Live Telemetry Active',
    this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    final accuracyColor = currentAccuracy >= 75.0
        ? AppTheme.successColor
        : (currentAccuracy >= 50.0 ? AppTheme.warningColor : AppTheme.errorColor);

    final paceLabel = avgPaceSeconds > 0
        ? (avgPaceSeconds <= 25.0 ? 'Optimal Pace' : 'Deliberate')
        : 'Pacing...';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF131C31),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF334155), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Pulse icon indicator
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.successColor,
            ),
          ),
          const SizedBox(width: 8),

          // Real-time Accuracy Pill
          _buildPill(
            context,
            icon: Icons.check_circle_rounded,
            label: '${currentAccuracy.toStringAsFixed(0)}%',
            sublabel: '$correctCount/$totalAnswered',
            color: accuracyColor,
          ),

          const SizedBox(width: 10),

          // Real-time Speed / Pacing Pill
          _buildPill(
            context,
            icon: Icons.speed_rounded,
            label: '${avgPaceSeconds.toStringAsFixed(1)}s',
            sublabel: paceLabel,
            color: AppTheme.secondaryColor,
          ),

          const SizedBox(width: 10),

          // Hesitation / Decisiveness indicator
          _buildPill(
            context,
            icon: optionChanges == 0 ? Icons.bolt_rounded : Icons.touch_app_rounded,
            label: optionChanges == 0 ? 'Decisive' : '$optionChanges toggles',
            sublabel: 'Choice Pacing',
            color: optionChanges == 0 ? AppTheme.primaryLight : AppTheme.warningColor,
          ),

          const Spacer(),

          if (onExpand != null)
            InkWell(
              onTap: onExpand,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.open_in_new_rounded,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPill(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String sublabel,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
            Text(
              sublabel,
              style: TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
