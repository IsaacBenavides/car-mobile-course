import 'package:car_mobile_course/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final UpdateCounterBloc _counterBloc = UpdateCounterBloc();

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              child: FloatingActionButton(
                heroTag: "decrement",
                child: const Text('-1'),
                onPressed: () => _counterBloc.decrementCounter(),
              ),
            ),
            Expanded(
              child: FloatingActionButton(
                heroTag: "reset",
                child: const Text('0'),
                onPressed: () => _counterBloc.resetCounter(),
              ),
            ),
            Expanded(
              child: FloatingActionButton(
                heroTag: "increment",
                child: const Text('+1'),
                onPressed: () => _counterBloc.incrementCounter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
