import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './widgets/OptionButton.dart';
import './widgets/Question.dart';
import './widgets/NavBar.dart';
import './widgets/NavButton.dart';

class QuizoftheDayCompleted extends StatefulWidget {
  const QuizoftheDayCompleted(
      {super.key, required this.title, required this.score});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  final int score;
  @override
  State<QuizoftheDayCompleted> createState() => _QuizoftheDayCompletedState();
}

class _QuizoftheDayCompletedState extends State<QuizoftheDayCompleted> {
  List<String> quizes = [
    'WW1',
    'WW2',
    'Balkan Wars',
    'Byzantium',
    '1821',
    'Quiz 6',
    'Quiz 7',
    'Quiz 8'
  ];

  int _counter = 0;

  void _onPressed() {
    Navigator.pushNamed(context, "/QOTD");
  }

  List<Widget> getQuizes() {
    List<Widget> QuizoftheDayCompletedNames = [];
    for (int i = 0; i < 8; i++) {
      QuizoftheDayCompletedNames.add(
          NavButton(btext: quizes[i], next: quizes[i], eP: () {}));
      QuizoftheDayCompletedNames.add(Container(height: 10));
    }
    return QuizoftheDayCompletedNames;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    double heightsize = 100;
    int score = widget.score;
    return Scaffold(
        /*appBar: AppBar(
          // Here we take the value from the QuizoftheDayCompleted object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),*/
        body: GestureDetector(
      onTap: _onPressed,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("../background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: 3 * heightsize,
                  child: Stack(
                    children: <Widget>[
                      Text('Quiz of the\nDay\nCompleted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      Text('Quiz of the\nDay\nCompleted',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                height: MediaQuery.of(context).size.height - 4 * heightsize,
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
                    Text('Click anywhere to continue',
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
    )
        /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Color.fromARGB(210, 255, 255, 255),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.purple,
        ),
      ),*/
        );
  }
}
