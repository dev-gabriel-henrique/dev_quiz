import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_colors.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double value;
  const ProgressIndicatorWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
