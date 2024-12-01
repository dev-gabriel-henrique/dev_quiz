import 'package:dev_quiz/home/widgets/score_card/score_card_widget.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../core/app_gradients.dart';
import '../../../core/app_text_styles.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({super.key, required this.user})
      : super(
          preferredSize: const Size.fromHeight(250),
          child: SizedBox(
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
                            text: user.name,
                            style: AppTextStyles.titleBold,
                          )
                        ],
                      )),
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(user.photoUrl),
                            )),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 1),
                  child: ScoreCardWidget(
                    percent: user.score / 100,
                  ),
                )
              ],
            ),
          ),
        );
}
