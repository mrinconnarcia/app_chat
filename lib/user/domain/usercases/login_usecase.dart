import 'package:proyecto_integrador/user/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<void> call(String email, String password) async {
    await repository.signIn(email, password);
  }
}
