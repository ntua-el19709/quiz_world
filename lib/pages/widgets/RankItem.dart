import 'package:flutter/material.dart';

class RankItem extends StatefulWidget {
  const RankItem(
      {super.key, required this.num, required this.name, required this.score});
  final int num;
  final String name;
  final int score;
  @override
  State<RankItem> createState() => _RankItemState();
}

class _RankItemState extends State<RankItem> {
  int num = 0, score = 0;
  String name = "";

  @override
  Widget build(BuildContext context) {
    num = widget.num;
    score = widget.score;
    name = widget.name;
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
              primary: const Color.fromARGB(255, 255, 193, 203),
              shape: const CircleBorder(),
            ),
            child: Text(
              '$num',
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 168,
          child: Center(
              child: Text(
            name,
            style: const TextStyle(color: Colors.black),
          )),
        ),
        Container(
          width: 50,
          child: Center(
              child: Text(
            '$score',
            style: const TextStyle(color: Colors.black),
          )),
        ),
      ]),
    );
  }
}
