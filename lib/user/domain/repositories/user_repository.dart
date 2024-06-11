import 'package:proyecto_integrador/user/data/models/usuario_model.dart';

abstract class UserRepository {
  Future<List<UsuarioModel>> getUsers();
}
