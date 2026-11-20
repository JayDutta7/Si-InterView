import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class FeedbackCard extends StatelessWidget {
  final bool isCorrect;
  final String explanation;
  final int responseTimeMs;
  final bool isLastQuestion;
  final VoidCallback onNext;

  const FeedbackCard({
    super.key,
    required this.isCorrect,
    required this.explanation,
    required this.responseTimeMs,
    required this.isLastQuestion,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = isCorrect ? AppTheme.successColor : AppTheme.errorColor;
    final seconds = (responseTimeMs / 1000.0).toStringAsFixed(1);

    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 24),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: statusColor.withValues(alpha: 0.35), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
                color: statusColor,
                size: 26,
              ),
              const SizedBox(width: 10),
              Text(
                isCorrect ? 'Correct!' : 'Incorrect',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: statusColor,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      size: 14,
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${seconds}s',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Explanation:',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            explanation,
            style: TextStyle(
              fontSize: 14.5,
              height: 1.45,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onNext,
              icon: Icon(isLastQuestion ? Icons.flag_rounded : Icons.arrow_forward_rounded),
              label: Text(
                isLastQuestion ? 'Complete Interview Session' : 'Next Question',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isCorrect ? AppTheme.primaryColor : statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
