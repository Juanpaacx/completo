import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';
import '../view_model/auth_controller.dart';
import '../view/cart_view.dart';
import 'package:tienda/view/ropa_hombres_view.dart';
import 'package:tienda/view/ropa_mujeres_view.dart';
import 'package:tienda/view/bisuteria_view.dart';
import 'package:tienda/view/electonica_view.dart';
import 'ProductDetaisView.dart';

class HomeView extends StatelessWidget {
  final ProductService productService = ProductService();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu estilo, tu camino'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart), // Icono de carrito de compras
            onPressed: () {
              Get.to(() => CartView()); // Navegar a la vista del carrito
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: productService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay productos disponibles'));
          } else {
            final products = snapshot.data!;
            return Column(
              children: [
                // Carrusel de productos aquí
                Container(
                  height: 200, // Altura del carrusel
                  child: PageView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(product.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Botones para las vistas
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => RopaHombresView());
                        },
                        child: Text('Ropa Hombres'),
                      ),
                      SizedBox(width: 8),
                      /*ElevatedButton(
                        onPressed: () {
                          Get.to(() => RopaMujeresView());
                        },
                        child: Text('Ropa Mujeres'),
                      ),*/
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => ElectronicaView());
                        },
                        child: Text('Electrónica'),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => BisuteriaView());
                        },
                        child: Text('Bisutería'),
                      ),
                    ],
                  ),
                ),
                // Listado de productos
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Ajustar a 3 columnas
                      childAspectRatio: 0.4, // Ajustar la relación ancho-alto
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          // Navegar a la pantalla de detalles del producto
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsView(
                                nombre: product.name,
                                precio: product.price
                                    .toString(), // Convertir a String si es necesario
                                imagen: product.imageUrl,
                                description: product.description,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.all(8.0),
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150, // Altura fija para la imagen
                                child: Image.network(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '\$${product.price}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
