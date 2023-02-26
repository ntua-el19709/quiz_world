import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RankItem extends StatefulWidget {
  const RankItem(
      {super.key, required this.num, required this.name, required this.score});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final int num;
  final String name;
  final int score;
  @override
  State<RankItem> createState() => _RankItemState();
}

class _RankItemState extends State<RankItem> {
  int _pressed = 0;
  int num = 0, score = 0;
  String name = "";
  int correct = 0; // 1 for correct, 0 for incorrect

  void _onPressed() {
    setState(() {
      _pressed = 1;
    });
  }

  MaterialColor _getColor() {
    if (_pressed == 0) return Colors.purple;
    if (correct == 1) return Colors.green;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    num = widget.num;
    score = widget.score;
    name = widget.name;
    //widget.opttext;
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width - 20,
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Container(
          width: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 255, 193, 203),
              shape: const CircleBorder(),
            ),
            child: Text(
              '$num',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 218,
          child: Center(
              child: Text(
            name,
            style: TextStyle(color: Colors.black),
          )),
        ),
        Container(
          width: 100,
          child: Center(
              child: Text(
            '$score',
            style: TextStyle(color: Colors.black),
          )),
        ),
      ]),
    );
  }
}
