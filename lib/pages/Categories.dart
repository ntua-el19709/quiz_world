import 'package:flutter/material.dart';
import './widgets/NavBar.dart';
import './widgets/NavButton.dart';

class Categories extends StatefulWidget {
  const Categories({super.key, required this.title});
  final String title;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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

  List<Widget> getCats() {
    List<Widget> CategoriesNames = [];
    for (int i = 0; i < 8; i++) {
      CategoriesNames.add(NavButton(
        btext: names[i],
        next: 'Category',
        eP: () {},
      ));
      CategoriesNames.add(Container(height: 10));
    }
    return CategoriesNames;
  }

  @override
  Widget build(BuildContext context) {
    double heightsize = (MediaQuery.of(context).size.width) / 9,
        fsize = (MediaQuery.of(context).size.width) / 11;
    if (heightsize > 100) heightsize = 100;
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
                      Text('Categories',
                          style: TextStyle(
                            fontSize: fsize,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          )),
                      Text('Categories',
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
                  height: MediaQuery.of(context).size.height - heightsize - 94,
                  width: MediaQuery.of(context).size.width - 20,
                  child: ListView(
                    shrinkWrap: true,
                    children: getCats(),
                  )),
              Container(
                height: 20,
              ),
              Container(height: 54, child: NavBar(page: 0)),
            ],
          ),
        ),
      ),
    );
  }
}
