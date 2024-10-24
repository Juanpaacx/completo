import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  final String nombre;
  final String precio;
  final String imagen;

  ProductDetailsView({
    required this.nombre,
    required this.precio,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                imagen,
                height: 300,
              ),
            ),
            SizedBox(height: 20),
            Text(
              nombre,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '\$${precio}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 20),
            Text(
              'Descripción del producto',
              style: TextStyle(fontSize: 16),
            ),
            // Aquí se podría añadir más información detallada del producto
          ],
        ),
      ),
    );
  }
}
