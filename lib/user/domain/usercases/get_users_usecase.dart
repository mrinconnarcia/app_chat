import 'package:proyecto_integrador/user/domain/repositories/user_repository.dart';
import 'package:proyecto_integrador/user/data/models/usuario_model.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  Future<List<UsuarioModel>> call() async {
    return await repository.getUsers();
  }
}
