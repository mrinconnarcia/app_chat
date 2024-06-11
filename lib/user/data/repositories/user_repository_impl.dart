import 'package:firebase_database/firebase_database.dart';
import 'package:proyecto_integrador/user/domain/repositories/user_repository.dart';
import 'package:proyecto_integrador/user/data/models/usuario_model.dart';

class UserRepositoryImpl implements UserRepository {
  final DatabaseReference _usersRef = FirebaseDatabase.instance.ref().child('users');

  @override
  Future<List<UsuarioModel>> getUsers() async {
    final DatabaseEvent event = await _usersRef.once();
    final DataSnapshot snapshot = event.snapshot;

    final List<UsuarioModel> users = [];
    if (snapshot.value != null) {
      final Map<String, dynamic> data = Map<String, dynamic>.from(snapshot.value as Map);
      data.forEach((key, value) {
        users.add(UsuarioModel.fromMap(Map<String, dynamic>.from(value as Map)));
      });
    }
    return users;
  }
}
