import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NavButton extends StatefulWidget {
  const NavButton({super.key, required this.btext, required this.next});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String btext;
  final String next;
  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  int _pressed = 0;
  int correct = 0; // 1 for correct, 0 for incorrect

  void _onPressed() {
    Navigator.pushNamed(context, '/' + widget.next);
  }

  @override
  Widget build(BuildContext context) {
    //correct = widget.correct;
    //widget.btext;
    return Container(
        height: 50,
        width: 500,
        child: TextButton(
          //autofocus: false,
          //clipBehavior: Clip.none,
          style: ElevatedButton.styleFrom(
              //backgroundColor: Colors.black,
              primary: Colors.purple,
              onPrimary: Colors.white,
              //onSurface: Colors.purple,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              side: BorderSide(width: 3, color: Colors.black)),
          onPressed: _onPressed,
          child: Text(widget.btext),
        ));
  }
}
