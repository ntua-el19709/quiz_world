import 'package:flutter/material.dart';
import 'package:my_app/pages/widgets/Arguments.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.page});
  final int page;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int page = -1;

  void _onPressed(int index) {
    String next = "/Categories";
    if (index == 1) next = "/QOTD";
    if (index == 2) {
      next = "/Challenge";
      Navigator.pushNamed(context, next, arguments: RankArguments('null', 0));
      return;
    }
    Navigator.pushNamed(context, next);
  }

  @override
  Widget build(BuildContext context) {
    page = widget.page;
    return Container(
      height: 10,
      width: MediaQuery.of(context).size.width,
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range_sharp), label: 'Quiz of the Day'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), label: 'Challenge Mode')
        ],
        currentIndex: page,
        onTap: _onPressed,
      ),
    );
  }
}
