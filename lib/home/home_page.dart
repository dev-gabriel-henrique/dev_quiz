import 'package:dev_quiz/challenge/challenge_page.dart';
import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/home/widgets/quizCard/quiz_card_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/appBar/app_bar_widget.dart';
import 'package:dev_quiz/home/home_controller.dart';
import 'package:dev_quiz/home/widgets/levelButton/level_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getQuizzes();
    controller.getUser();

    controller.stateNotifier.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller.stateNotifier
        .removeListener(() {}); // Remover listener ao descartar
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(label: "Fácil"),
                  LevelButtonWidget(label: "Médio"),
                  LevelButtonWidget(label: "Difícil"),
                  LevelButtonWidget(label: "Períto"),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: controller.quizzes!
                        .map((e) => QuizCardWidget(
                              title: e.title,
                              percent: e.questionAnswered / e.questions.length,
                              completed:
                                  "${e.questionAnswered}/${e.questions.length}",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChallengePage(
                                            questions: e.questions,
                                            title: e.title,
                                          )),
                                );
                              },
                            ))
                        .toList()),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
