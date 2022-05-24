import 'dart:async';
import 'package:flutter/material.dart';

class ChangeThemeBloc {
  final _changeThemeController = StreamController<ThemeMode>.broadcast();

  Stream<ThemeMode> get changeThemeStream => _changeThemeController.stream;

  void changeTheme(bool value) {
    if (value) {
      _changeThemeController.add(ThemeMode.dark);
    } else {
      _changeThemeController.add(ThemeMode.light);
    }
  }

  void dispose() {
    _changeThemeController.close();
  }
}
