import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Category {
  final String name;
  final String description;
  final Color color;

  Category(
      {required this.name, required this.description, required this.color});
}

class CategoryFormPage extends StatefulWidget {
  final Function(Category) onCategorySaved;

  CategoryFormPage({required this.onCategorySaved});

  @override
  _CategoryFormPageState createState() => _CategoryFormPageState();
}

class _CategoryFormPageState extends State<CategoryFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  Color _selectedColor = Colors.blue; // Color por defecto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Categoría'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Ingrese el nombre de la categoría',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Descripción:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Ingrese una descripción (opcional)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Color:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                _openColorPicker();
              },
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _selectedColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Seleccionar color',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveCategory(context);
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seleccione un color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  _selectedColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _saveCategory(BuildContext context) {
    final String name = _nameController.text.trim();
    final String description = _descriptionController.text.trim();
    final Category category =
        Category(name: name, description: description, color: _selectedColor);

    if (name.isNotEmpty) {
      widget.onCategorySaved(
          category); // Llama a la función de devolución de llamada
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor ingrese el nombre de la categoría'),
          backgroundColor: Colors.red, // Establecer el color de fondo en rojo
          behavior: SnackBarBehavior
              .floating, // Muestra la Snackbar en la parte superior
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
