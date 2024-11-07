/*import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  final String nombre;
  final String precio;
  final String imagen;
  final String description;

  ProductDetailsView({
    required this.nombre,
    required this.precio,
    required this.imagen,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(nombre), // Mostrar el nombre del producto en la barra superior
      ),
      body: SingleChildScrollView(
        // Scroll si el contenido es largo
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
                '\Descripcion${description}',
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
              ElevatedButton(
                onPressed: () {
                  // Acción de compra (puedes personalizar esta acción)
                },
                child: Text('Agregar al Carrito'),
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
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '../controller/cart_controller.dart';

class ProductDetailsView extends StatelessWidget {
  final String nombre;
  final String precio;
  final String imagen;
  final String description;
  final int stock;
  final String size;
  final String color;
  final String categoryName;
  final int categoryId;

  // Instancia del controlador de carrito
  final CartController cartController = Get.put(CartController());

  ProductDetailsView({
    required this.nombre,
    required this.precio,
    required this.imagen,
    required this.description,
    required this.stock,
    required this.size,
    required this.color,
    required this.categoryName,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    // Crear un objeto de categoría
    final category = Category(
      id: categoryId,
      name: categoryName,
    );

    // Crear un objeto de producto con todos los parámetros requeridos
    final product = Product(
      id: 1, // ID estático; cambia esto si es dinámico en tu aplicación
      name: nombre,
      description: description,
      price: double.parse(precio),
      stock: stock,
      size: size,
      color: color,
      imageUrl: imagen,
      category: category,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
      ),
      body: SingleChildScrollView(
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
              // Descripción del producto
              Text(
                'Descripción: $description',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              // Botones en fila
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        cartController.addToCart(product);
                        Get.snackbar(
                          'Producto agregado',
                          'Has agregado $nombre al carrito.',
                          snackPosition: SnackPosition.BOTTOM,
                          duration: Duration(seconds: 2),
                        );
                      },
                      child: Text('Comprar ahora'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        cartController.addToCart(product);
                        Get.snackbar(
                          'Producto agregado',
                          '$nombre ha sido añadido al carrito.',
                          snackPosition: SnackPosition.BOTTOM,
                          duration: Duration(seconds: 2),
                        );
                      },
                      child: Text('Agregar al Carrito'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
