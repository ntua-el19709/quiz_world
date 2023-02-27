import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './widgets/Question.dart';
import './widgets/Arguments.dart';

import 'package:audioplayers/audioplayers.dart';

class QuizPage extends StatefulWidget {
  static const routeName = '/QuizPage';
  const QuizPage({
    super.key,
    required this.title,
    required this.quiztitle,
    required this.type,
    required this.score,
  });

  final String title, quiztitle, type;
  final int score;
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int answered = 0, score = 0;
  String type = "";
  final player = AudioCache();

  void _onPressed(int cor) {
    if (cor == 1)
      setState(() {
        answered = 11;
      });
    else
      setState(() {
        answered = 1;
      });
  }

  void _onPressedNext() {
    if (answered == 0) return;
    if (type == 'Challenge' && answered == 11) {
      Navigator.pushNamed(context, '/QuizPage',
          arguments: QuizArguments(type, score + 10, widget.title));
    } else if (type == 'Quiz' && answered == 1) {
      Navigator.pushNamed(context, '/QuizPage',
          arguments: QuizArguments(type, score - 1, widget.title));
    } else {
      player.play('sound_effects/clapping.mp3');
      Navigator.pushNamed(context, "/" + type + "Completed",
          arguments: QuizScore(score + answered - 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    score = widget.score;
    String title = widget.quiztitle;
    if (title == "Take Quiz of the Day") title = "Quiz of the Day";
    if (title == "Take Challenge") title = "Challenge";
    type = widget.type;
    double heightsize = (MediaQuery.of(context).size.height) / 10,
        fsize = (MediaQuery.of(context).size.width) / 12;
    if (heightsize > 100) heightsize = 100;
    return Scaffold(
        body: GestureDetector(
      onTap: _onPressedNext,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: heightsize,
                  child: Stack(
                    children: <Widget>[
                      Text(title,
                          style: TextStyle(
                            fontSize: fsize,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      Text(title,
                          style: TextStyle(
                            fontSize: fsize,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                height: 30,
              ),
              Container(
                  height:
                      (MediaQuery.of(context).size.height - heightsize - 60),
                  child: Question(
                    qtext: 'x-2=2. x=',
                    opt1t: '2',
                    opt2t: '3',
                    opt3t: '4',
                    opt4t: '5',
                    cor: 3,
                    qnum: 1,
                    eP: _onPressed,
                    ePN: _onPressedNext,
                  )),
              Container(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
