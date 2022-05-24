import 'package:car_mobile_course/change_color/main.dart';
import 'package:car_mobile_course/counter/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Course',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const ListButtons(),
    );
  }
}

class ListButtons extends StatelessWidget {
  const ListButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MyMenuButton(
            title: "Change Color",
            actionTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ChangeColor(),
              ),
            ),
          ),
          MyMenuButton(
            title: "Counter",
            actionTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Counter(),
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
