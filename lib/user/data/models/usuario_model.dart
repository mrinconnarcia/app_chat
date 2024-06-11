import 'package:firebase_database/firebase_database.dart';
import 'package:proyecto_integrador/user/domain/entities/usuario.dart';

class UsuarioModel extends Usuario {
  UsuarioModel({required String nombre, required String email}) : super(nombre: nombre, email: email);

  factory UsuarioModel.fromMap(Map<String, dynamic> data) {
    return UsuarioModel(
      nombre: data['nombre'] as String,
      email: data['email'] as String,
    );
  }
}
