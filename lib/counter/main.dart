import 'package:car_mobile_course/counter/bloc/counter_bloc.dart';
import 'package:car_mobile_course/counter/bloc/provider.dart';
import 'package:car_mobile_course/counter/pages/home.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CounterApp();
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      updateCounterBloc: UpdateCounterBloc(),
      child: const MaterialApp(
        title: 'Counter',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
