import 'package:flutter/material.dart';
import 'product_page.dart';
import 'order_page.dart';
import 'category_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario'),
      ),
      body: Center(
        child: SizedBox(
          height: 400, // Altura de las tarjetas
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: 3, // Número de tarjetas
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return _buildCard(context, 'Categorías', Icons.category, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoryPage()),
                    );
                  });
                case 1:
                  return _buildCard(context, 'Productos', Icons.shopping_basket,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductPage()),
                    );
                  });
                case 2:
                  return _buildCard(context, 'Pedidos', Icons.assignment, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderPage()),
                    );
                  });
                default:
                  return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, String title, IconData icon, Function() onTap) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          onTap: onTap,
        ),
      ),
    );
  }
}
