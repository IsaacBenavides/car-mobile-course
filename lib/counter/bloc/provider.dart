import 'package:car_mobile_course/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  const Provider(
      {Key? key, required this.updateCounterBloc, required Widget child})
      : super(key: key, child: child);

  final UpdateCounterBloc updateCounterBloc;

  static Provider of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<Provider>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
