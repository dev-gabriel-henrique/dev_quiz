import 'package:dev_quiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/app_gradients.dart';
import '../../../core/app_text_styles.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({super.key})
      : super(
          preferredSize: const Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                        text: "Olá ",
                        style: AppTextStyles.title,
                        children: [
                          TextSpan(
                            text: "Gabriel!",
                            style: AppTextStyles.titleBold,
                          )
                        ],
                      )),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/170420229?v=4"),
                            )),
                      )
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment(0, 1),
                  child: ScoreCardWidget(),
                )
              ],
            ),
          ),
        );
}
