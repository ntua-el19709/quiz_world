import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './widgets/OptionButton.dart';
import './widgets/Question.dart';
import './widgets/NavBar.dart';
import './widgets/NavButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Category(
        title: 'Flutter Demo Home Page',
        category: 'History',
      ),
    );
  }
}

class Category extends StatefulWidget {
  const Category({super.key, required this.title, required this.category});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  final String category;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
    Navigator.pushNamed(context, '/Categories');
  }

  List<Widget> getQuizes() {
    List<Widget> CategoryNames = [];
    for (int i = 0; i < 8; i++) {
      CategoryNames.add(NavButton(btext: quizes[i], next: 'QuizPage'));
      CategoryNames.add(Container(height: 10));
    }
    return CategoryNames;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of/pages widgets.
    double heightsize = 100;
    String category = widget.category;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Category object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
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
                  height: heightsize,
                  child: Stack(
                    children: <Widget>[
                      Text(category,
                          style: TextStyle(
                            fontSize: 80,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      Text(category,
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                height: MediaQuery.of(context).size.height - heightsize - 520,
              ),
              Container(
                  height: 364,
                  width: 500,
                  child: ListView(
                    shrinkWrap: true,
                    children: getQuizes(),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        tooltip: 'Increment',
        backgroundColor: Color.fromARGB(210, 255, 255, 255),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.purple,
        ),
      ),
    );
  }
}
