import 'package:car_mobile_course/bloc/change_color_bloc.dart';
import 'package:car_mobile_course/bloc/change_theme.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  const Provider(
      {Key? key,
      required this.changeThemeBloc,
      required this.changeColorBloc,
      required Widget child})
      : super(key: key, child: child);

  final ChangeColorBloc? changeColorBloc;
  final ChangeThemeBloc? changeThemeBloc;

  static Provider of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<Provider>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
