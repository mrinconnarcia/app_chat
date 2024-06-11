import 'package:flutter/material.dart';
import 'package:proyecto_integrador/user/infraestructure/models/mensaje.dart';

class MensajeWidget extends StatelessWidget {
  final Mensaje mensaje;

  MensajeWidget(this.mensaje);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            child: Text(mensaje.remitente[0]),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mensaje.remitente,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(mensaje.texto),
                SizedBox(height: 4.0),
                Text(
                  mensaje.fecha,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
