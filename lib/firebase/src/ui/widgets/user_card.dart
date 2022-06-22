import 'dart:math';

import 'package:car_mobile_course/colors.dart';
import 'package:car_mobile_course/firebase/src/entities/register.dart';
import 'package:car_mobile_course/firebase/src/ui/routes/names.dart';
import 'package:car_mobile_course/firebase/utils/responsive.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.register}) : super(key: key);

  final Register register;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
        width: responsive.wp(40),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(responsive.dp(1.5)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12.withOpacity(0.07),
                  blurRadius: 10,
                  spreadRadius: 1)
            ]),
        child: LayoutBuilder(builder: (context, c) {
          double dp =
              pow((pow(c.maxHeight, 2) + pow(c.maxWidth, 2)), 1 / 2).toDouble();
          final TextStyle textStyle =
              TextStyle(fontWeight: FontWeight.bold, fontSize: dp * 0.06);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: register.image!,
                child: CircleAvatar(
                    radius: dp * 0.15,
                    backgroundImage: Image.network(register.image!).image),
              ),
              SizedBox(height: c.maxHeight * 0.05),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: c.maxWidth * 0.08),
                  child: Text(register.name! + " " + register.lastName!,
                      textAlign: TextAlign.center, style: textStyle)),
              SizedBox(height: c.maxHeight * 0.01),
              Text(register.phone!.toString(),
                  style: TextStyle(color: Colors.grey, fontSize: dp * 0.05)),
              SizedBox(height: c.maxHeight * 0.05),
              _BorderButton(
                  text: "Details",
                  borderColor: AppColors.primary,
                  onPressed: () => Navigator.of(context)
                      .pushNamed(Names.details, arguments: register))
            ],
          );
        }));
  }
}

class _BorderButton extends StatelessWidget {
  final String text;
  final Color borderColor;
  final VoidCallback onPressed;
  const _BorderButton(
      {Key? key,
      required this.text,
      required this.borderColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey.withOpacity(0.4);
              }
              return Colors.white;
            },
          ),
          elevation: MaterialStateProperty.resolveWith((states) => 0),
          side: MaterialStateProperty.resolveWith<BorderSide>(
              (states) => BorderSide(color: borderColor))),
    );
  }
}
