import 'package:car_mobile_course/change_color/main.dart';
import 'package:car_mobile_course/colors.dart';
import 'package:car_mobile_course/counter/main.dart';
import 'package:car_mobile_course/firebase/src/data/repository.dart';
import 'package:car_mobile_course/firebase/src/provider.dart';
import 'package:car_mobile_course/firebase/src/ui/pages/firebase_ui.dart';
import 'package:car_mobile_course/firebase/src/ui/routes/routes.dart';
import 'package:car_mobile_course/firebase_options.dart';
import 'package:car_mobile_course/games/pages/page_1.dart';
import 'package:car_mobile_course/list_buttons.dart';
import 'package:car_mobile_course/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      repository: Repository(),
      child: MaterialApp(
        title: 'Mobile Course',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: AppColors.primary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const ListButtons(),
        onGenerateRoute: CustomRoutes.routes,
      ),
    );
  }
}
