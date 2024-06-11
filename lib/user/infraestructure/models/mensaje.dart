import 'package:firebase_database/firebase_database.dart';

class Mensaje {
  final String remitente;
  final String fecha;
  final String texto;

  Mensaje(this.remitente, this.fecha, this.texto);

  factory Mensaje.fromSnapshot(DataSnapshot snapshot) {
    final Map<String, dynamic> data = Map<String, dynamic>.from(snapshot.value as Map);
    return Mensaje(
      data['remitente'] as String,
      data['fecha'] as String,
      data['texto'] as String,
    );
  }
}
