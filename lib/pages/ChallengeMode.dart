import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/pages/widgets/RankItem.dart';
import './widgets/OptionButton.dart';
import './widgets/Question.dart';
import './widgets/NavBar.dart';
import './widgets/NavButton.dart';

class Challenge extends StatefulWidget {
  const Challenge({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  List<String> names = [
    'History',
    'Geography',
    'Music',
    'Category 4',
    'Category 5',
    'Category 6',
    'Category 7',
    'Category 8'
  ];
  List<String> Rnames = [
    'Kostakis',
    'Petrakis',
    'Giorgakis',
    'Agathoklis',
    'Name',
    'Name',
    'Name',
    'Name',
    'Name',
    'Name',
    'Name',
    'Name'
  ];

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  List<Widget> getCats() {
    List<Widget> ChallengeNames = [];
    for (int i = 0; i < 8; i++) {
      ChallengeNames.add(NavButton(btext: names[i], next: names[i], eP: () {}));
      ChallengeNames.add(Container(height: 10));
    }
    return ChallengeNames;
  }

  int max(int a, int b) {
    if (a > b) return a;
    return b;
  }

  List<Widget> getRanking() {
    List<Widget> Ranks = [];
    for (int i = 0; i < 12; i++) {
      Ranks.add(
          RankItem(num: i + 1, name: Rnames[i], score: max(120 - 30 * i, 0)));
      Ranks.add(Container(height: 10));
    }
    return Ranks;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    double heightsize = 80;
    return Scaffold(
      /*appBar: AppBar(
        // Here we take the value from the Challenge object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),*/
      body: Container(
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
                  height: 2 * heightsize,
                  child: Stack(
                    children: <Widget>[
                      Text('Challenge\nMode',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 70,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      Text('Challenge\nMode',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 70,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                  height: heightsize,
                  child: Stack(
                    children: <Widget>[
                      Text('Ranking',
                          style: TextStyle(
                            fontSize: 40,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      Text('Ranking',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                height: (MediaQuery.of(context).size.height -
                        6 * heightsize -
                        124) /
                    2,
              ),
              Container(
                height: 3 * heightsize,
                width: MediaQuery.of(context).size.width - 20,
                child: TextButton(
                    //autofocus: false,
                    //clipBehavior: Clip.none,
                    style: ElevatedButton.styleFrom(
                        //backgroundColor: Colors.black,
                        primary: Color.fromARGB(210, 255, 255, 255),
                        //onPrimary: Colors.white,
                        //onSurface: Colors.purple,
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        side: BorderSide(width: 3, color: Colors.black)),
                    onPressed: () {},
                    child: Container(
                        child: ListView(
                      shrinkWrap: true,
                      children: getRanking(),
                    ))),
              ),
              Container(
                  height: (MediaQuery.of(context).size.height -
                          6 * heightsize -
                          124) /
                      2),
              Container(
                  height: 50,
                  child: NavButton(
                      btext: 'Take Challenge', next: 'QuizPage', eP: () {})),
              Container(
                height: 20,
              ),
              Container(height: 54, child: NavBar(page: 2)),
            ],
          ),
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
