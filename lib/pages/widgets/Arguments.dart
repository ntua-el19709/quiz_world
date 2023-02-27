class QuizScore {
  final int score;

  QuizScore(this.score);
}

class CategoryArg {
  final String category;

  CategoryArg(this.category);
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
