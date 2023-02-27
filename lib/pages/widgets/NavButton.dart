import 'package:flutter/material.dart';
import './Arguments.dart';

class NavButtonQuiz extends StatefulWidget {
  const NavButtonQuiz(
      {super.key,
      required this.btext,
      required this.next,
      required this.eP,
      required this.type});

  final String btext;
  final String next, type;
  final Function eP;
  @override
  State<NavButtonQuiz> createState() => _NavButtonQuizState();
}

class _NavButtonQuizState extends State<NavButtonQuiz> {
  String type = "";
  String btext = "";

  void _onPressed() {
    Navigator.pushNamed(context, '/' + widget.next,
        arguments: QuizArguments(type, 0, btext));
    widget.eP();
  }

  @override
  Widget build(BuildContext context) {
    type = widget.type;
    btext = widget.btext;
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width - 20,
        child: TextButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              onPrimary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              side: const BorderSide(width: 3, color: Colors.black)),
          onPressed: _onPressed,
          child: Text(widget.btext),
        ));
  }
}

class NavButton extends StatefulWidget {
  const NavButton(
      {super.key, required this.btext, required this.next, required this.eP});

  final String btext;
  final String next;
  final Function eP;
  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  void _onPressed() {
    Navigator.pushNamed(context, '/' + widget.next,
        arguments: CategoryArg(widget.btext));
    widget.eP();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width - 20,
        child: TextButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              onPrimary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              side: const BorderSide(width: 3, color: Colors.black)),
          onPressed: _onPressed,
          child: Text(widget.btext),
        ));
  }
}
