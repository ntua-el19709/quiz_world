import 'package:flutter/material.dart';

class QuizCompleted extends StatefulWidget {
  static const routeName = '/QuizCompleted';
  const QuizCompleted({super.key, required this.title, required this.score});
  final String title;
  final int score;
  @override
  State<QuizCompleted> createState() => _QuizCompletedState();
}

class _QuizCompletedState extends State<QuizCompleted> {
  void _onPressed() {
    Navigator.pushNamed(context, "/Categories");
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
                  height: 2 * heightsize,
                  child: Stack(
                    children: <Widget>[
                      Text('Quiz\nCompleted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      const Text('Quiz\nCompleted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                height:
                    (MediaQuery.of(context).size.height - 5 * heightsize) / 2,
              ),
              Container(
                height: 2 * heightsize,
                width: 200,
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(210, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      side: const BorderSide(width: 3, color: Colors.black)),
                  onPressed: () {},
                  child: Text('SCORE\n\n$score',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                      )),
                ),
              ),
              Container(
                height:
                    (MediaQuery.of(context).size.height - 5 * heightsize) / 2,
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
