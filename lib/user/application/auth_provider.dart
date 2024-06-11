import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  Future<void> signIn(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    _user = userCredential.user;
    notifyListeners();
  }

  Future<void> register(String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    _user = userCredential.user;
    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
