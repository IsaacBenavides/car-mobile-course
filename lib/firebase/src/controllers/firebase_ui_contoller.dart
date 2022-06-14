import 'dart:async';

import 'package:car_mobile_course/firebase/src/controllers/base.dart';
import 'package:car_mobile_course/firebase/src/data/repository.dart';
import 'package:car_mobile_course/firebase/src/entities/register.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseUiController implements Controller<Repository> {
  late Repository _repository;
  final _registersController = StreamController<Registers>.broadcast();
  Stream<Registers> get registersStream => _registersController.stream;

  @override
  void init(Repository dependency) {
    _repository = dependency;
  }

  Future<void> callRegister() async {
    try {
      final Stream<DatabaseEvent> _result = _repository.getRegisters();
      _result.listen((event) {
        Registers registers = Registers.fromJson(event.snapshot.value as List);
        _registersController.add(registers);
      });
    } catch (e) {
      _registersController.addError(e);
    }
  }
}
