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
        title: Text(nombre), // Mostrar el nombre del producto en la barra superior
      ),
      body: SingleChildScrollView( // Scroll si el contenido es largo
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del producto
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(imagen),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Nombre del producto
              Text(
                nombre,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Precio del producto
              Text(
                '\$${precio}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              // Descripción del producto (puedes agregar más detalles aquí)
              Text(
                'Descripción del producto va aquí. Puedes detallar las características del producto, sus materiales, cuidados, etc.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              // Botón para comprar (esto es opcional)
              ElevatedButton(
                onPressed: () {
                  // Acción de compra (puedes personalizar esta acción)
                },
                child: Text('Comprar ahora'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
