import 'package:flutter/material.dart';

class QuizoftheDayCompleted extends StatefulWidget {
  const QuizoftheDayCompleted(
      {super.key, required this.title, required this.score});
  final String title;
  final int score;
  @override
  State<QuizoftheDayCompleted> createState() => _QuizoftheDayCompletedState();
}

class _QuizoftheDayCompletedState extends State<QuizoftheDayCompleted> {
  void _onPressed() {
    Navigator.pushNamed(context, "/QOTD");
  }

  @override
  Widget build(BuildContext context) {
    double heightsize = 100;
    int score = widget.score;
    return Scaffold(
        body: GestureDetector(
      onTap: _onPressed,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("../background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 3 * heightsize,
                  child: Stack(
                    children: <Widget>[
                      Text('Quiz of the\nDay\nCompleted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      const Text('Quiz of the\nDay\nCompleted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                height: MediaQuery.of(context).size.height - 4 * heightsize,
              ),
              Container(
                height: heightsize,
                child: Stack(
                  children: <Widget>[
                    Text('Click anywhere to continue',
                        style: TextStyle(
                          fontSize: 15,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.black,
                        )),
                    const Text('Click anywhere to continue',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
