import 'package:flutter/material.dart';
import 'src/authentication_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventario App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: AuthenticationPage(
          authFormType: AuthFormType
              .register), // Establece el formulario de registro como el inicial
    );
  }
}
