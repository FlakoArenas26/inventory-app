import 'package:flutter/material.dart';
import './category_form_page.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorías'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.category_outlined,
              size: 150,
              color: Colors.grey[400],
            ),
            Text(
              '¡Aún no hay categorías!',
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
          _navigateToCategoryForm(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  void _navigateToCategoryForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CategoryFormPage(
                onCategorySaved: (Category) {},
              )),
    );
  }

  // Métodos para navegación y construcción de elementos de lista
}
