import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_integrador/user/application/auth_provider.dart';
import 'package:proyecto_integrador/user/domain/usercases/get_users_usecase.dart';
import 'package:proyecto_integrador/user/presentation/pages/registrarse.dart';
import 'package:proyecto_integrador/user/presentation/pages/chat_comunitario.dart';
import 'package:proyecto_integrador/user/presentation/pages/login_page.dart';
import 'package:proyecto_integrador/user/presentation/pages/lista_usuarios.dart';
import 'package:proyecto_integrador/user/data/repositories/auth_repository_impl.dart';
import 'package:proyecto_integrador/user/data/repositories/user_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        Provider(create: (_) => GetUsersUseCase(UserRepositoryImpl())),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/register': (context) => Registrarse(),
          '/chat': (context) => ChatComunitario(),
          '/users': (context) => ListaUsuarios(),
        },
      ),
    );
  }
}
