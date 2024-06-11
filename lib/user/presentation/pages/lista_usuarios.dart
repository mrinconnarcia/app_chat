import 'package:flutter/material.dart';

class ListaUsuarios extends StatefulWidget {
  @override
  _ListaUsuariosState createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  final List<String> _usuarios = [
    'Juan Pérez',
    'María García',
    'Pedro Rodríguez',
    'Ana Fernández',
    'Carlos López',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
      ),
      body: ListView.builder(
        itemCount: _usuarios.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('${_usuarios[index][0]}'),
            ),
            title: Text(_usuarios[index]),
          );
        },
      ),
    );
  }
}