import 'package:car_mobile_course/firebase/src/ui/pages/details.dart';
import 'package:car_mobile_course/firebase/src/ui/pages/firebase_ui.dart';
import 'package:car_mobile_course/firebase/src/ui/routes/names.dart';
import 'package:flutter/material.dart';

class CustomRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case Names.home:
        return MaterialPageRoute(builder: (context) => const FirebaseUi());
      case Names.details:
        return MaterialPageRoute(
            builder: (context) => const DetailsPage(), settings: settings);
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
