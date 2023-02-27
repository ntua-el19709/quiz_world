import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

class OptionButton extends StatefulWidget {
  const OptionButton(
      {super.key,
      required this.opttext,
      required this.correct,
      required this.answered,
      required this.eP});

  final String opttext;
  final int correct;
  final Function eP;
  final int answered;
  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  int _pressed = 0; //if THIS option is selected
  int answered = 1; //if an option has already been seleccted
  int correct = 0; // 1 for correct, 0 for incorrect

  void _onPressed() {
    widget.eP(correct);
    if (answered == 0) {
      setState(() {
        _pressed = 1;
      });
      answered = 1;
      if (correct == 0) {
        HapticFeedback.heavyImpact();
        //Vibration.vibrate(duration: 1000);
      }
    }
  }

  MaterialColor _getColor() {
    if (answered == 1 && correct == 1) return Colors.green;
    if (_pressed == 0) return Colors.purple;
    if (correct == 1) return Colors.green;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    answered = widget.answered;
    correct = widget.correct;
    return Container(
        height: 30,
        width: MediaQuery.of(context).size.width - 40,
        child: TextButton(
          style: ElevatedButton.styleFrom(
              primary: _getColor(),
              onPrimary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              side: const BorderSide(width: 3, color: Colors.black)),
          onPressed: _onPressed,
          child: Text(widget.opttext),
        ));
  }
}
