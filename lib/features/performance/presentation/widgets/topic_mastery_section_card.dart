import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../quiz/presentation/screens/quiz_setup_screen.dart';
import '../../domain/services/performance_scoring_engine.dart';

class TopicMasterySectionCard extends StatelessWidget {
  final String sectionName;
  final List<TopicMasteryStat> topics;

  const TopicMasterySectionCard({
    super.key,
    required this.sectionName,
    required this.topics,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFF131C31),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Color(0xFF334155), width: 1.2),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.folder_special_rounded,
                  size: 20,
                  color: AppTheme.secondaryColor,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    sectionName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${topics.length} Topics',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryLight,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            ...topics.map((t) {
              final color = t.masteryScore >= 75.0
                  ? AppTheme.successColor
                  : (t.masteryScore >= 50.0 ? AppTheme.warningColor : AppTheme.errorColor);

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHigh.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: t.isWeak
                        ? AppTheme.errorColor.withValues(alpha: 0.3)
                        : Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                t.topic,
                                style: const TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Raw: ${t.rawAccuracy.toStringAsFixed(0)}% • n = ${t.attemptsCount} attempts • ${t.confidenceDamping.toStringAsFixed(0)}% sample confidence',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withValues(alpha: 0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${t.masteryScore.toStringAsFixed(0)}%',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: color,
                              ),
                            ),
                            if (t.isWeak)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => QuizSetupScreen(
                                          initialSections: [sectionName],
                                        ),
                                      ),
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(6),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppTheme.errorColor.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: AppTheme.errorColor.withValues(alpha: 0.4),
                                      ),
                                    ),
                                    child: const Text(
                                      'Practice Weak',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.errorColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: LinearProgressIndicator(
                        value: (t.masteryScore / 100.0).clamp(0.0, 1.0),
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
                        valueColor: AlwaysStoppedAnimation<Color>(color),
                        minHeight: 5,
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
}
