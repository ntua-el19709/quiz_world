import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      required this.qnum});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String qtext;
  final String opt1t;
  final String opt2t;
  final String opt3t;
  final String opt4t;
  final int cor;
  final int qnum;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int _pressed = 0;
  int qnum = 0;
  int cor1 = 0, cor2 = 0, cor3 = 0, cor4 = 0; // 1 for correct, 0 for incorrect
/*
  void _onPressed() {
    setState(() {
      _pressed = 1;
    });
  }
  */
/*
  MaterialColor _getColor() {
    if (_pressed == 0) return Colors.purple;
    if (correct == 1) return Colors.green;
    return Colors.red;
  }
*/
  @override
  Widget build(BuildContext context) {
    qnum = widget.qnum;
    if (widget.cor == 1) cor1 = 1;
    if (widget.cor == 2) cor2 = 1;
    if (widget.cor == 3) cor3 = 1;
    if (widget.cor == 4) cor4 = 1;
    //widget.opttext;
    double widthsize = MediaQuery.of(context).size.width;
    return Container(
        width: widthsize - 20,
        height: 280,
        child: TextButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(210, 255, 255, 255),
                //onPrimary: Colors.white,
                //onSurface: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                side: BorderSide(width: 5, color: Colors.black)),
            onPressed: () {},
            child: Column(//backgroundColor: Color.fromARGB(210, 255, 255, 255)
                children: <Widget>[
              Container(height: 10),
              Container(
                  child: Text('Question #$qnum',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ))),
              Container(height: 20),
              Container(
                  child: Text(widget.qtext,
                      style: TextStyle(fontSize: 40, color: Colors.black))),
              Container(height: 20),
              Container(
                  height: 50,
                  width: widthsize - 40,
                  child: OptionButton(correct: cor1, opttext: widget.opt1t)),
              Container(height: 10),
              Container(
                  height: 50,
                  width: widthsize - 40,
                  child: OptionButton(correct: cor2, opttext: widget.opt2t)),
              Container(height: 10),
              Container(
                  height: 50,
                  width: widthsize - 40,
                  child: OptionButton(correct: cor3, opttext: widget.opt3t)),
              Container(height: 10),
              Container(
                  height: 50,
                  width: widthsize - 40,
                  child: OptionButton(correct: cor4, opttext: widget.opt4t)),
              Container(height: 10),
            ])));
  }
}
