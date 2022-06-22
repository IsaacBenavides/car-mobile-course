import 'dart:async';

import 'package:car_mobile_course/firebase/src/controllers/base.dart';
import 'package:car_mobile_course/firebase/src/data/repository.dart';
import 'package:car_mobile_course/firebase/src/entities/register.dart';
import 'package:firebase_database/firebase_database.dart';

class DetailsController implements Controller<Repository> {
  late Repository _repository;
  final _registerController = StreamController<Register>.broadcast();
  Stream<Register> get registerStream => _registerController.stream;

  @override
  void init(Repository dependency) {
    _repository = dependency;
  }

  Future<void> callRegisterByUser(int id) async {
    try {
      final Stream<DatabaseEvent> _result = _repository.getRegistersByUser(id);
      _result.listen((event) {
        try {
          Register register = Register.fromJson(
              Map<String, dynamic>.from(event.snapshot.value! as Map));
          _registerController.add(register);
        } catch (e) {
          _registerController.addError(e);
        }
      }).onError((e) => _registerController.addError(e));
    } catch (e) {
      _registerController.addError(e);
    }
  }
}
