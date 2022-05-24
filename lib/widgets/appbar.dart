import 'package:car_mobile_course/bloc/change_color_bloc.dart';
import 'package:car_mobile_course/bloc/change_theme.dart';
import 'package:car_mobile_course/bloc/provider.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget with PreferredSizeWidget {
  const AppBarCustom({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  Size get preferredSize => const Size(0, kToolbarHeight);
}

class _AppBarCustomState extends State<AppBarCustom> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    final ChangeColorBloc _changeColor = Provider.of(context).changeColorBloc!;
    final ChangeThemeBloc _changeTheme = Provider.of(context).changeThemeBloc!;
    return StreamBuilder<Color>(
        stream: _changeColor.color,
        builder: (context, snapshot) {
          return AppBar(
            centerTitle: false,
            title: Text(widget.title),
            backgroundColor: snapshot.data,
            actions: [
              Switch(
                  thumbColor: MaterialStateColor.resolveWith((states) =>
                      snapshot.data ?? Theme.of(context).colorScheme.secondary),
                  activeTrackColor: Colors.grey.withOpacity(0.2),
                  value: _isDark,
                  onChanged: (value) {
                    _changeTheme.changeTheme(value);
                    setState(() {
                      _isDark = value;
                    });
                  })
            ],
          );
        });
  }
}
