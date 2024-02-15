import 'package:flutter/material.dart';
import 'order_form_page.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.list_alt_outlined,
            size: 150,
            color: Colors.grey[400],
          ),
          Text('¡Aún no hay pedidos!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToOrderForm(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  void _navigateToOrderForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderFormPage()),
    );
  }

  // Métodos para navegación y construcción de elementos de lista
}
