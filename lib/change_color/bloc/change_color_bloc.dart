import 'dart:async';
import 'package:flutter/material.dart';

class ChangeColorBloc {
  final _color = StreamController<Color>.broadcast();

  Stream<Color> get color => _color.stream;

  void changeColor(Color color) {
    _color.add(color);
  }

  dispose() {
    _color.close();
  }
}
