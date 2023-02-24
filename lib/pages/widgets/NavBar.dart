import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.page});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final int page;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int page = -1;

  void _onPressed() {
    setState(() {
      //_pressed = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    page = widget.page;
    //widget.opttext;
    return Container(
        height: 10,
        width: 500,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.date_range_sharp), label: 'Quiz of the Day'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border), label: 'Challenge Mode')
          ],
          currentIndex: page,
        ));
  }
}
