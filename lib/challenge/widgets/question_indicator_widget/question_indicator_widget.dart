import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int lenght;

  const QuestionIndicatorWidget({
    super.key,
    required this.currentPage,
    required this.lenght,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Questão $currentPage",
              style: AppTextStyles.body,
            ),
            Text(
              "de $lenght",
              style: AppTextStyles.body,
            ),
          ]),
          const SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(
            value: currentPage / lenght,
          )
        ],
      ),
    );
  }
}
