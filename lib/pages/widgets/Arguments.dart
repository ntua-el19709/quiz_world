import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class QuizScore {
  final int score;

  QuizScore(this.score);
}

class RankArguments {
  final int curscore;
  final String name;
  RankArguments(this.name, this.curscore);
}

class QuizArguments {
  final String type, quiztitle;
  final int score;

  QuizArguments(this.type, this.score, this.quiztitle);
}
