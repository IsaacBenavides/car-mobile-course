import 'dart:async';

class UpdateCounterBloc {
  int _count = 0;
  final _counter = StreamController<int>.broadcast();
  Stream<int> get counter => _counter.stream;

  void incrementCounter() {
    _count++;
    _counter.add(_count);
  }

  void decrementCounter() {
    _count--;
    _counter.add(_count);
  }

  void resetCounter() {
    _count = 0;
    _counter.add(_count);
  }

  dispose() {
    _counter.close();
  }
}
