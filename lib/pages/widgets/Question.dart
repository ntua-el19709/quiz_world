import 'package:flutter/material.dart';
import './OptionButton.dart';

class Question extends StatefulWidget {
  const Question(
      {super.key,
      required this.qtext,
      required this.opt1t,
      required this.opt2t,
      required this.opt3t,
      required this.opt4t,
      required this.cor,
      required this.qnum,
      required this.eP,
      required this.ePN});
  final String qtext;
  final String opt1t;
  final String opt2t;
  final String opt3t;
  final String opt4t;
  final int cor;
  final int qnum;
  final Function eP;
  final Function ePN;
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int _pressed = 0;
  int qnum = 0;
  int cor1 = 0, cor2 = 0, cor3 = 0, cor4 = 0; // 1 for correct, 0 for incorrect

  void _onPressed(cor) {
    if (_pressed == 0) {
      setState(() {
        _pressed = 1;
      });
      if (cor == 1)
        widget.eP(1);
      else
        widget.eP(0);
    } else {
      widget.ePN();
    }
  }

  void _onPressedNext() {
    if (_pressed == 1) widget.ePN();
  }

  @override
  Widget build(BuildContext context) {
    qnum = widget.qnum;
    if (widget.cor == 1) cor1 = 1;
    if (widget.cor == 2) cor2 = 1;
    if (widget.cor == 3) cor3 = 1;
    if (widget.cor == 4) cor4 = 1;
    double widthsize = MediaQuery.of(context).size.width;
    return Container(
        width: widthsize - 20,
        height: 280,
        child: TextButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(210, 255, 255, 255),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                side: const BorderSide(width: 5, color: Colors.black)),
            onPressed: _onPressedNext,
            child: Column(children: <Widget>[
              Container(height: 10),
              Container(
                  child: Text('Question #$qnum',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ))),
              Container(height: 20),
              Container(
                  child: Text(widget.qtext,
                      style:
                          const TextStyle(fontSize: 40, color: Colors.black))),
              Container(height: 20),
              Container(
                  height: 50,
                  width: widthsize - 40,
                  child: OptionButton(
                    correct: cor1,
                    opttext: widget.opt1t,
                    answered: _pressed,
                    eP: _onPressed,
                  )),
              Container(height: 10),
              Container(
                  height: 50,
                  width: widthsize - 40,
                  child: OptionButton(
                    correct: cor2,
                    opttext: widget.opt2t,
                    answered: _pressed,
                    eP: _onPressed,
                  )),
              Container(height: 10),
              Container(
                  height: 50,
                  width: widthsize - 40,
                  child: OptionButton(
                    correct: cor3,
                    opttext: widget.opt3t,
                    eP: _onPressed,
                    answered: _pressed,
                  )),
              Container(height: 10),
              Container(
                  height: 50,
                  width: widthsize - 40,
                  child: OptionButton(
                    correct: cor4,
                    opttext: widget.opt4t,
                    eP: _onPressed,
                    answered: _pressed,
                  )),
              Container(height: 10),
            ])));
  }
}
