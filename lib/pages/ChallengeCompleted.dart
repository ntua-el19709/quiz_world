import 'package:flutter/material.dart';
import './widgets/NavButton.dart';
import './widgets/Arguments.dart';

class ChallengeCompleted extends StatefulWidget {
  static const routeName = '/ChallengeCompleted';
  const ChallengeCompleted(
      {super.key, required this.title, required this.score});
  final String title;
  final int score;
  @override
  State<ChallengeCompleted> createState() => _ChallengeCompletedState();
}

class _ChallengeCompletedState extends State<ChallengeCompleted> {
  TextEditingController name = TextEditingController();
  void _onPressed() {
    String temp = name.text;
    if (temp == "") temp = "user";
    Navigator.pushNamed(context, "/Challenge",
        arguments: RankArguments(temp, widget.score));
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
                      Text('Challenge\nCompleted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      const Text('Challenge\nCompleted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                height:
                    (MediaQuery.of(context).size.height - 5 * heightsize - 70) /
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
                    (MediaQuery.of(context).size.height - 5 * heightsize - 70) /
                        2,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 20,
                child: TextFormField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    hintText: 'user',
                    labelText: 'Enter your name',
                    filled: true,
                    fillColor: Color.fromARGB(210, 255, 255, 255),
                  ),
                  controller: name,
                ),
              ),
              Container(height: 20),
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
