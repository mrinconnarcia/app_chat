import 'package:proyecto_integrador/user/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signIn(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  @override
  Future<User?> register(String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
