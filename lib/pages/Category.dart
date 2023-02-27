import 'package:flutter/material.dart';
import './widgets/NavButton.dart';

class Category extends StatefulWidget {
  const Category({super.key, required this.title, required this.category});

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

  void _onPressed() {
    Navigator.pushNamed(context, '/Categories');
  }

  List<Widget> getQuizes() {
    List<Widget> CategoryNames = [];
    for (int i = 0; i < 8; i++) {
      CategoryNames.add(NavButtonQuiz(
          btext: quizes[i], next: 'QuizPage', eP: () {}, type: 'Quiz'));
      CategoryNames.add(Container(height: 10));
    }
    return CategoryNames;
  }

  @override
  Widget build(BuildContext context) {
    double heightsize = (MediaQuery.of(context).size.width) / 9,
        fsize = (MediaQuery.of(context).size.width) / 11;
    if (heightsize > 100) heightsize = 100;
    String category = widget.category;
    return Scaffold(
      body: Container(
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
                  height: heightsize,
                  child: Stack(
                    children: <Widget>[
                      Text(category,
                          style: TextStyle(
                            fontSize: fsize,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      Text(category,
                          style: TextStyle(
                            fontSize: fsize,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Container(
                height: 20,
              ),
              Container(
                  height: MediaQuery.of(context).size.height - heightsize - 20,
                  width: MediaQuery.of(context).size.width - 20,
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
        tooltip: 'Back',
        backgroundColor: const Color.fromARGB(210, 255, 255, 255),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.purple,
        ),
      ),
    );
  }
}
