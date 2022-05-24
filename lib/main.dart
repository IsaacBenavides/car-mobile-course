import 'package:car_mobile_course/bloc/change_color_bloc.dart';
import 'package:car_mobile_course/bloc/change_theme.dart';
import 'package:car_mobile_course/bloc/provider.dart';
import 'package:car_mobile_course/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Provider(
      changeColorBloc: ChangeColorBloc(),
      changeThemeBloc: ChangeThemeBloc(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChangeThemeBloc _changeTheme = Provider.of(context).changeThemeBloc!;
    return StreamBuilder<ThemeMode>(
        stream: _changeTheme.changeThemeStream,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Mobile Course',
            debugShowCheckedModeBanner: false,
            themeMode: snapshot.data,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            home: const HomePage(title: 'MOBILE COURSE CAR IV'),
          );
        });
  }
}
