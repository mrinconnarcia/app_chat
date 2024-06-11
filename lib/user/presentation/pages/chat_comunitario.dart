import 'package:flutter/material.dart';

class ChatComunitario extends StatefulWidget {
  @override
  _ChatComunitarioState createState() => _ChatComunitarioState();
}

class _ChatComunitarioState extends State<ChatComunitario> {
  final List<Mensaje> _mensajes = [
    Mensaje('Martín', '02-06-24 10:01:23', 'Hola, ¿cómo están?'),
    Mensaje('Daniel', '02-06-24 10:01:23', 'Hola Martín, todo bien por aquí.'),
  ];

  int _paginaActual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Comunitario'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _mensajes.length,
              itemBuilder: (context, index) {
                return MensajeWidget(_mensajes[index]);
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                    // Acción para abrir la cámara
                  },
                ),
                IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: () {
                    // Acción para grabar un mensaje de voz
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Escribe...',
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    ),
                    onSubmitted: (texto) {
                      // Acción para enviar el mensaje
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Acción para enviar el mensaje
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaActual,
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
          _navigateToPage(context, index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Usuarios',
          ),
        ],
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
      // Mantener en la misma página (ChatComunitario)
        break;
      case 1:
        Navigator.pushNamed(context, '/perfil');
        break;
    }
  }
}

class Mensaje {
  final String remitente;
  final String fecha;
  final String texto;

  Mensaje(this.remitente, this.fecha, this.texto);
}

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