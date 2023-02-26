import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OptionButton extends StatefulWidget {
  const OptionButton({super.key, required this.opttext, required this.correct});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String opttext;
  final int correct;
  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  int _pressed = 0;
  int correct = 0; // 1 for correct, 0 for incorrect

  void _onPressed() {
    setState(() {
      _pressed = 1;
    });
  }

  MaterialColor _getColor() {
    if (_pressed == 0) return Colors.purple;
    if (correct == 1) return Colors.green;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    correct = widget.correct;
    //widget.opttext;
    return Container(
        height: 30,
        width: MediaQuery.of(context).size.width - 40,
        child: TextButton(
          //autofocus: false,
          //clipBehavior: Clip.none,
          style: ElevatedButton.styleFrom(
              //backgroundColor: Colors.black,
              primary: _getColor(),
              onPrimary: Colors.white,
              //onSurface: Colors.purple,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              side: BorderSide(width: 3, color: Colors.black)),
          onPressed: _onPressed,
          child: Text(widget.opttext),
        ));
  }
}
