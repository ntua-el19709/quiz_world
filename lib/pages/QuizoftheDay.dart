import 'package:flutter/material.dart';
import './widgets/NavBar.dart';
import './widgets/NavButton.dart';

class QuizoftheDay extends StatefulWidget {
  static const routeName = '/QOTD';
  const QuizoftheDay({super.key, required this.title});
  final String title;
  @override
  State<QuizoftheDay> createState() => _QuizoftheDayState();
}

class _QuizoftheDayState extends State<QuizoftheDay> {
  int _counter = 0;
  void _onPressed() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightsize = 100;
    return Scaffold(
      body: Container(
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
                      Text('Quiz of the\nDay',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      const Text('Quiz of the\nDay',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                height: (MediaQuery.of(context).size.height -
                        4 * heightsize -
                        124) /
                    2,
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
                  child: Text('Daily Streak\n\n$_counter',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      )),
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height -
                        4 * heightsize -
                        124) /
                    2,
              ),
              Container(
                  height: 50,
                  child: NavButtonQuiz(
                    btext: 'Take Quiz of the Day',
                    next: 'QuizPage',
                    eP: _onPressed,
                    type: 'QOTD',
                  )),
              Container(
                height: 20,
              ),
              Container(height: 54, child: NavBar(page: 1)),
            ],
          ),
        ),
      ),
    );
  }
}
