import 'package:car_mobile_course/firebase/utils/responsive.dart';
import 'package:car_mobile_course/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const ListButtons()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
        backgroundColor: const Color(0xff38c172),
        body: Center(
          child: Lottie.asset("assets/animations/splash.json",
              width: responsive.dp(50), height: responsive.dp(50)),
        ));
  }
}
