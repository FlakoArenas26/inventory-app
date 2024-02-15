import 'package:flutter/material.dart';
import 'package:inventory/src/home_page.dart';

enum AuthFormType {
  login,
  register,
}

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key, required AuthFormType authFormType})
      : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  AuthFormType _authFormType = AuthFormType.register;

  void _toggleForm() {
    setState(() {
      _authFormType = _authFormType == AuthFormType.register
          ? AuthFormType.login
          : AuthFormType.register;
    });
  }

  Widget _buildForm() {
    if (_authFormType == AuthFormType.register) {
      return _buildRegisterForm();
    } else {
      return _buildLoginForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_authFormType == AuthFormType.register
            ? 'Registro'
            : 'Inicio de Sesión'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildForm(),
                SizedBox(height: 10.0),
                TextButton(
                  onPressed: _toggleForm,
                  child: Text(
                    _authFormType == AuthFormType.register
                        ? '¿Ya tienes una cuenta? Iniciar Sesión'
                        : '¿No tienes una cuenta? Registrarse',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Card(
      elevation: 4.0,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15.0), // Radio de esquina establecido en 15.0
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey.withOpacity(0.8),
            ],
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Registro',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nombre de Usuario',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _navigateToHome(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Color azul para el botón de registro
              ),
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  Widget _buildLoginForm() {
    return Card(
      elevation: 4.0,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15.0), // Radio de esquina establecido en 15.0
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey.withOpacity(0.8),
            ],
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Inicio de Sesión',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _navigateToHome(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors
                    .green, // Color verde para el botón de inicio de sesión
              ),
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
