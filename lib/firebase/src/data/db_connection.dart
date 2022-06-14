import 'package:firebase_database/firebase_database.dart';

class DbConnection {
  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  static DatabaseReference createRef(String path) {
    return _database.ref(path);
  }
}
