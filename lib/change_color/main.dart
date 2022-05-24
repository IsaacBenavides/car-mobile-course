import 'package:car_mobile_course/change_color/bloc/change_color_bloc.dart';
import 'package:car_mobile_course/change_color/bloc/change_theme.dart';
import 'package:car_mobile_course/change_color/bloc/provider.dart';
import 'package:car_mobile_course/change_color/pages/home.dart';
import 'package:flutter/material.dart';

class ChangeColor extends StatelessWidget {
  const ChangeColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      changeColorBloc: ChangeColorBloc(),
      changeThemeBloc: ChangeThemeBloc(),
      child: const ChangeColorApp(),
    );
  }
}

class ChangeColorApp extends StatelessWidget {
  const ChangeColorApp({Key? key}) : super(key: key);

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
