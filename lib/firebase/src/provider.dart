import 'package:car_mobile_course/firebase/src/data/repository.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  const Provider({Key? key, required Widget child, required this.repository})
      : super(key: key, child: child);

  static Provider of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<Provider>()!;

  final Repository repository;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
