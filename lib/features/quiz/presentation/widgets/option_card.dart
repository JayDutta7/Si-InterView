import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class OptionCard extends StatelessWidget {
  final int index;
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool showResult;
  final bool highlightCorrectAnswer;
  final VoidCallback? onTap;

  const OptionCard({
    super.key,
    required this.index,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.showResult,
    this.highlightCorrectAnswer = false,
    this.onTap,
  });

  String get _optionLetter {
    switch (index) {
      case 0:
        return 'A';
      case 1:
        return 'B';
      case 2:
        return 'C';
      case 3:
        return 'D';
      default:
        return '${index + 1}';
    }
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = Theme.of(context).colorScheme.outlineVariant;
    Color backgroundColor = Theme.of(context).cardTheme.color ?? const Color(0xFF1E293B);
    Color letterBgColor = Theme.of(context).colorScheme.surfaceContainerHigh;
    Color letterTextColor = Theme.of(context).colorScheme.onSurface;
    Widget? trailingIcon;

    if (showResult) {
      if (isSelected && isCorrect) {
        borderColor = AppTheme.successColor;
        backgroundColor = AppTheme.successColor.withValues(alpha: 0.12);
        letterBgColor = AppTheme.successColor;
        letterTextColor = Colors.white;
        trailingIcon = const Icon(
          Icons.check_circle_rounded,
          color: AppTheme.successColor,
          size: 24,
        );
      } else if (isSelected && !isCorrect) {
        borderColor = AppTheme.errorColor;
        backgroundColor = AppTheme.errorColor.withValues(alpha: 0.12);
        letterBgColor = AppTheme.errorColor;
        letterTextColor = Colors.white;
        trailingIcon = const Icon(
          Icons.cancel_rounded,
          color: AppTheme.errorColor,
          size: 24,
        );
      } else if (isCorrect && highlightCorrectAnswer) {
        borderColor = AppTheme.successColor;
        backgroundColor = AppTheme.successColor.withValues(alpha: 0.12);
        letterBgColor = AppTheme.successColor;
        letterTextColor = Colors.white;
        trailingIcon = const Icon(
          Icons.check_circle_rounded,
          color: AppTheme.successColor,
          size: 24,
        );
      }
    } else if (isSelected) {
      borderColor = AppTheme.primaryLight;
      backgroundColor = AppTheme.primaryLight.withValues(alpha: 0.12);
      letterBgColor = AppTheme.primaryLight;
      letterTextColor = Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: showResult ? null : onTap,
          borderRadius: BorderRadius.circular(14),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: borderColor,
                width: isSelected || (showResult && isCorrect && (isSelected || highlightCorrectAnswer)) ? 2 : 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Option Letter Badge
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: letterBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    _optionLetter,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: letterTextColor,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                // Option Text
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.35,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                if (trailingIcon != null) ...[
                  const SizedBox(width: 10),
                  trailingIcon,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
