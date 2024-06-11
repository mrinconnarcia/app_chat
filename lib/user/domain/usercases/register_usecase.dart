import 'package:proyecto_integrador/user/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<void> call(String email, String password) async {
    await repository.register(email, password);
  }
}
