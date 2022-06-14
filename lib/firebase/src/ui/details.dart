import 'package:car_mobile_course/firebase/src/entities/register.dart';
import 'package:car_mobile_course/firebase/utils/responsive.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Register _register =
        ModalRoute.of(context)!.settings.arguments as Register;
    final Responsive _responsive = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: _register.image!,
              child: CircleAvatar(
                backgroundImage: NetworkImage(_register.image!),
                radius: _responsive.dp(10),
              ),
            ),
            SizedBox(height: _responsive.hp(3)),
            Text(_register.name!,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: _responsive.dp(3))),
            Text(_register.lastName!,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: _responsive.dp(3))),
          ],
        ),
      )),
    );
  }
}
