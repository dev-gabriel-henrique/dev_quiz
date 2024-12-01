// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dev_quiz/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse =>
      {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito,
      }[this] ??
      (throw ArgumentError('Nível inválido: $this'));
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito",
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String imagem;
  final Level level;

  QuizModel({
    required this.level,
    required this.title,
    required this.imagem,
    required this.questions,
    this.questionAnswered = 0,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'imagem': imagem,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'] as String,
      questions: List<QuestionModel>.from(
        (map['questions'] as List).map<QuestionModel>(
          (x) => QuestionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      questionAnswered: map['questionAnswered'] as int,
      imagem: map['imagem'] as String,
      level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
