import 'package:car_mobile_course/counter/bloc/counter_bloc.dart';
import 'package:car_mobile_course/counter/bloc/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UpdateCounterBloc _counterBloc =
        Provider.of(context).updateCounterBloc;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter: ",
              style: Theme.of(context).textTheme.headline4,
            ),
            StreamBuilder(
                stream: _counterBloc.counter,
                initialData: 0,
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const FloatingButtons(),
    );
  }
}

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UpdateCounterBloc _counterBloc =
        Provider.of(context).updateCounterBloc;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          heroTag: "decrement",
          child: const Text('-1'),
          onPressed: () => _counterBloc.decrementCounter(),
        ),
        FloatingActionButton(
          heroTag: "reset",
          child: const Text('0'),
          onPressed: () => _counterBloc.resetCounter(),
        ),
        FloatingActionButton(
          heroTag: "increment",
          child: const Text('+1'),
          onPressed: () => _counterBloc.incrementCounter(),
        ),
      ],
    );
  }
}
