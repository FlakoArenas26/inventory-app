import 'package:flutter/material.dart';
import './product_form_page.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
              size: 150,
              color: Colors.grey[400],
            ),
            Text(
              '¡Aún no hay productos!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToProductForm(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  void _navigateToProductForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductFormPage()),
    );
  }
}
