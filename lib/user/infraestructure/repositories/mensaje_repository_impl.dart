import 'package:proyecto_integrador/user/infraestructure/models/mensaje.dart';
import 'package:firebase_database/firebase_database.dart';

class MensajeRepositoryImpl {
  final DatabaseReference _messagesRef = FirebaseDatabase.instance.reference().child('messages');

  Stream<List<Mensaje>> getMessages() {
    return _messagesRef.onChildAdded.map((event) {
      return [Mensaje.fromSnapshot(event.snapshot)];
    });
  }

  Future<void> sendMessage(String remitente, String texto) async {
    _messagesRef.push().set({
      'remitente': remitente,
      'fecha': DateTime.now().toString(),
      'texto': texto,
    });
  }
}
