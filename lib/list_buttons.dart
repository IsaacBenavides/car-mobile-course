import 'package:car_mobile_course/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:car_mobile_course/change_color/main.dart';
import 'package:car_mobile_course/counter/main.dart';
import 'package:car_mobile_course/firebase/src/ui/pages/firebase_ui.dart';
import 'package:car_mobile_course/games/pages/page_1.dart';
import 'package:car_mobile_course/splash/splash_page.dart';
import 'package:flutter/material.dart';

class ListButtons extends StatelessWidget {
  const ListButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Course Task'),
      ),
      body: ListView(
        children: [
          MyMenuButton(
            title: "Tarea 1 - Change Color",
            actionTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ChangeColor(),
              ),
            ),
          ),
          MyMenuButton(
            title: "Tarea 1 - Counter",
            actionTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Counter(),
              ),
            ),
          ),
          MyMenuButton(
            title: "Tarea 2 - List Games",
            actionTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Page1(),
              ),
            ),
          ),
          MyMenuButton(
            title: "Tarea 2 - Firebase",
            actionTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FirebaseUi(),
              ),
            ),
          ),
          MyMenuButton(
            title: "Tarea 3 - Splash",
            actionTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SplashPage(),
              ),
            ),
          ),
          MyMenuButton(
            title: "Tarea 3 - Botton Navigator Bar",
            actionTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BottomNavigatorBar(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyMenuButton extends StatelessWidget {
  final String? title;
  final VoidCallback? actionTap;

  const MyMenuButton({Key? key, this.title, this.actionTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        height: 50.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: Text(title!),
        onPressed: actionTap,
      ),
    );
  }
}
