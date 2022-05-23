import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class ChangeColorBloc {
  final _color = StreamController<Color>.broadcast();

  Stream<Color> get color => _color.stream;

  void changeColor(Color color) {
    _color.add(color);
  }

  dispose() {
    _color.close();
  }
}

class UpdateCounterBloc {
  static int _count = 0;
  final _counter = StreamController<int>.broadcast();
  Stream<int> get counter => _counter.stream;
  void updateCounter() {
    _count++;
    _counter.add(_count);
  }

  dispose() {
    _counter.close();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final ChangeColorBloc _changeColor = ChangeColorBloc();
  final UpdateCounterBloc _updateCounter = UpdateCounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
                stream: _updateCounter.counter,
                initialData: 0,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
            StreamBuilder<Color>(
                stream: _changeColor.color,
                initialData: Colors.black,
                builder: (context, snapshot) {
                  return Text(
                    "Este Texto va a cambiar de color cada vez que se presione el botón",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: snapshot.data,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  );
                }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Cambiar Estado"),
        onPressed: () {
          _updateCounter.updateCounter();
          _changeColor.changeColor(
              Colors.primaries[Random().nextInt(Colors.primaries.length)]);
        },
        tooltip: 'Increment',
      ),
    );
  }
}
