import 'dart:math';

import 'package:car_mobile_course/bloc/change_color_bloc.dart';
import 'package:car_mobile_course/bloc/change_theme.dart';
import 'package:car_mobile_course/bloc/provider.dart';
import 'package:car_mobile_course/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final ChangeColorBloc _changeColor = Provider.of(context).changeColorBloc!;
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBarCustom(
          title: title,
        ),
        body: Center(
          child: StreamBuilder<Color>(
              stream: _changeColor.color,
              builder: (context, snapshot) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: _size.height * 0.02),
                      Container(
                        width: _size.height * 0.2,
                        height: _size.height * 0.2,
                        decoration: BoxDecoration(
                          color: snapshot.data ??
                              Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(height: _size.height * 0.05),
                      Text(
                        "Este Texto va a cambiar de color cada vez que se presione el botón",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: snapshot.data,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: _size.height * 0.05),
                      ColorPicker(
                          pickerAreaBorderRadius: BorderRadius.circular(5),
                          pickerColor: snapshot.data ??
                              Theme.of(context).colorScheme.secondary,
                          onColorChanged: (Color color) {
                            _changeColor.changeColor(color);
                          })
                    ],
                  ),
                );
              }),
        ));
  }
}
