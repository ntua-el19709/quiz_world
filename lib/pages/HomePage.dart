import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onPressed() {
    Navigator.pushNamed(context, "/Categories");
  }

  @override
  Widget build(BuildContext context) {
    double heightsize = (MediaQuery.of(context).size.width) / 4,
        fsize = (MediaQuery.of(context).size.width) / 6;
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
                          Text('QUIZ\nWORLD',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: fsize,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 6
                                  ..color = Colors.black,
                              )),
                          Text('QUIZ\nWORLD',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: fsize,
                                color: Colors.white,
                              )),
                        ],
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height - 3 * heightsize,
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
          )),
    );
  }
}
