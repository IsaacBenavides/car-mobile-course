import 'dart:async';

class UpdateCounterBloc {
  int _count = 1;
  final _counter = StreamController<int>.broadcast();
  Stream<int> get counter => _counter.stream;
  void updateCounter() {
    _counter.add(_count++);
  }

  dispose() {
    _counter.close();
  }
}
