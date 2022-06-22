import 'dart:developer';

import 'package:car_mobile_course/firebase/src/data/db_connection.dart';
import 'package:car_mobile_course/firebase/src/entities/register.dart';
import 'package:firebase_database/firebase_database.dart';

class Repository {
  static DatabaseReference get _registerRef =>
      DbConnection.createRef("/Registros");

  Stream<DatabaseEvent> getRegisters() {
    try {
      Stream<DatabaseEvent> response = _registerRef.onValue;
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Stream<DatabaseEvent> getRegistersByUser(int id) {
    try {
      Stream<DatabaseEvent> response = _registerRef.child("/$id").onValue;
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
