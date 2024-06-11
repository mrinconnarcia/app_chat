import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseService {
  final DatabaseReference _usersRef = FirebaseDatabase.instance.reference().child('users');

  Future<List<DataSnapshot>> getUsers() async {
    DataSnapshot snapshot = (await _usersRef.once()) as DataSnapshot;
    return snapshot.children.toList();
  }
}
