import 'dart:developer';

import 'package:car_mobile_course/firebase/src/data/db_connection.dart';
import 'package:firebase_database/firebase_database.dart';

class Repository {
  static DatabaseReference get _registerRef =>
      DbConnection.createRef("/Registros");

  static Future<void> createRegister(register) async {
    DatabaseReference ref = _registerRef;
    try {
      await ref.set(register);
    } catch (e) {
      log(e.toString());
    }
  }

  Stream<DatabaseEvent> getRegisters() {
    try {
      Stream<DatabaseEvent> response = _registerRef.onValue;
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<DataSnapshot> getRegistersByUser(int id) async {
    Future<DataSnapshot> result = _registerRef.child("/$id").get();
    result.then((value) => log(value.value.toString()));
    return result;
  }
}
