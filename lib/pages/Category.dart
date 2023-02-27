import 'package:flutter/material.dart';
import './widgets/NavButton.dart';

class Category extends StatefulWidget {
  static const routeName = '/Category';
  const Category({super.key, required this.title, required this.category});

  final String title;
  final String category;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<String> quizes = [
    'Quiz 1',
    'Quiz 2',
    'Quiz 3',
    'Quiz 4',
    'Quiz 5',
    'Quiz 6',
    'Quiz 7',
    'Quiz 8',
    'Quiz 9',
    'Quiz 10',
    'Quiz 11',
    'Quiz 12',
    'Quiz 13',
    'Quiz 14',
    'Quiz 15',
    'Quiz 16',
    'Quiz 17',
    'Quiz 18',
    'Quiz 19',
    'Quiz 20',
  ];
  void setquizes() {
    if (widget.category == 'History') {
      quizes[0] = 'WW1';
      quizes[1] = 'WW2';
      quizes[2] = 'Balkan Wars';
      quizes[3] = 'Byzantium';
      quizes[4] = '1821';
    }
    if (widget.category == 'Geography') {
      quizes[0] = 'Countries';
      quizes[1] = 'Flags';
      quizes[2] = 'Oceans';
      quizes[3] = 'Continents';
      quizes[4] = 'Islands';
    }
    if (widget.category == 'Music') {
      quizes[0] = 'Classical Composers';
      quizes[1] = 'Rap Artists';
      quizes[2] = 'Grammys';
      quizes[3] = 'Pop Singers';
      quizes[4] = 'Instruments';
    }
  }

  void _onPressed() {
    Navigator.pushNamed(context, '/Categories');
  }

  List<Widget> getQuizes() {
    List<Widget> CategoryNames = [];
    for (int i = 0; i < 20; i++) {
      CategoryNames.add(NavButtonQuiz(
          btext: quizes[i], next: 'QuizPage', eP: () {}, type: 'Quiz'));
      CategoryNames.add(Container(height: 10));
    }
    return CategoryNames;
  }

  @override
  Widget build(BuildContext context) {
    setquizes();
    double heightsize = (MediaQuery.of(context).size.width) / 9,
        fsize = (MediaQuery.of(context).size.width) / 11;
    if (heightsize > 100) heightsize = 100;
    String category = widget.category;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
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
