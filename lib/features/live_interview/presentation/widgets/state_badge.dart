import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/interview_exchange.dart';

class StateBadge extends StatelessWidget {
  final LiveBotState state;

  const StateBadge({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    Color badgeColor;
    String label;
    IconData icon;

    switch (state) {
      case LiveBotState.connecting:
        badgeColor = AppTheme.warningColor;
        label = 'Connecting...';
        icon = Icons.sync_rounded;
        break;
      case LiveBotState.listening:
        badgeColor = AppTheme.successColor;
        label = 'Listening to Candidate';
        icon = Icons.mic_rounded;
        break;
      case LiveBotState.botSpeaking:
        badgeColor = AppTheme.primaryLight;
        label = 'Interviewer Speaking';
        icon = Icons.volume_up_rounded;
        break;
      case LiveBotState.evaluatingAnswer:
        badgeColor = AppTheme.accentColor;
        label = 'Evaluating Answer...';
        icon = Icons.psychology_rounded;
        break;
      case LiveBotState.idle:
        badgeColor = Colors.grey;
        label = 'Idle';
        icon = Icons.pause_circle_outline_rounded;
        break;
      case LiveBotState.sessionEnded:
        badgeColor = AppTheme.errorColor;
        label = 'Interview Finished';
        icon = Icons.stop_circle_rounded;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: badgeColor.withValues(alpha: 0.4), width: 1.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: badgeColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              color: badgeColor,
            ),
          ),
        ],
      ),
    );
  }
}
