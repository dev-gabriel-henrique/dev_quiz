import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    super.key,
    required this.title,
    required this.length,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                      text: "Você concluiu",
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                          text: "\n$title",
                          style: AppTextStyles.bodyBold,
                        ),
                        TextSpan(
                          text: "\ncom $result de $length acertos!",
                          style: AppTextStyles.body,
                        ),
                      ]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                              "Dev Quiz NLW 5 Flutter: Resultado do Quiz: @$title\nObtive ${(result / length * 100).toInt()}% dos acertos!",
                            );
                          }),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.transparent(
                            label: "Voltar ao início",
                            onTap: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
