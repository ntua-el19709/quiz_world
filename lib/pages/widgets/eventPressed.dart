import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:event/event.dart';

class EventPressed {
  int value = 0;

  final Pressed = Event();

  void pressed() {
    value = 1;
    Pressed.broadcast();
    print('event pressed');
  }
}
