import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_integrador/user/application/auth_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo',
                  helperText: 'Error, por favor ingresa el correcto o completa el campo',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu correo electrónico';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  helperText: 'Error, por favor ingresa el correcto o completa el campo',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu contraseña';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await authProvider.signIn(_emailController.text, _passwordController.text);
                    Navigator.pushReplacementNamed(context, '/chat');
                  }
                },
                child: Text('Iniciar sesión'),
              ),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/register'),
                child: Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
