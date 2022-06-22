import 'package:flutter/material.dart';

class Utils {
  static showBottomSheet(BuildContext context, Widget widget) {
    showModalBottomSheet(
        context: context,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (context) {
          return widget;
        });
  }
}
