import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:event/event.dart';
import 'package:my_app/pages/QuizPage.dart';
import 'package:my_app/pages/widgets/eventPressed.dart';
import './Arguments.dart';

class NavButtonQuiz extends StatefulWidget {
  const NavButtonQuiz(
      {super.key,
      required this.btext,
      required this.next,
      required this.eP,
      required this.type});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String btext;
  final String next, type;
  final Function eP;
  @override
  State<NavButtonQuiz> createState() => _NavButtonQuizState();
}

class _NavButtonQuizState extends State<NavButtonQuiz> {
  int _pressed = 0;
  int correct = 0; // 1 for correct, 0 for incorrect
  String type = "";
  String btext = "";

  void _onPressed() {
    Navigator.pushNamed(context, '/' + widget.next,
        arguments: QuizArguments(type, 0, btext));
    print('pressed');
    widget.eP();
  }

  @override
  Widget build(BuildContext context) {
    type = widget.type;
    btext = widget.btext;
    //correct = widget.correct;
    //widget.btext;
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width - 20,
        child: TextButton(
          //autofocus: false,
          //clipBehavior: Clip.none,
          style: ElevatedButton.styleFrom(
              //backgroundColor: Colors.black,
              primary: Colors.purple,
              onPrimary: Colors.white,
              //onSurface: Colors.purple,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              side: BorderSide(width: 3, color: Colors.black)),
          onPressed: _onPressed,
          child: Text(widget.btext),
        ));
  }
}

class NavButton extends StatefulWidget {
  const NavButton(
      {super.key, required this.btext, required this.next, required this.eP});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String btext;
  final String next;
  final Function eP;
  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  int _pressed = 0;
  int correct = 0; // 1 for correct, 0 for incorrect

  void _onPressed() {
    Navigator.pushNamed(
      context,
      '/' + widget.next,
    );
    print('pressed');
    widget.eP();
  }

  @override
  Widget build(BuildContext context) {
    //correct = widget.correct;
    //widget.btext;
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width - 20,
        child: TextButton(
          //autofocus: false,
          //clipBehavior: Clip.none,
          style: ElevatedButton.styleFrom(
              //backgroundColor: Colors.black,
              primary: Colors.purple,
              onPrimary: Colors.white,
              //onSurface: Colors.purple,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              side: BorderSide(width: 3, color: Colors.black)),
          onPressed: _onPressed,
          child: Text(widget.btext),
        ));
  }
}
