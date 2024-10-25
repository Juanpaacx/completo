import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';

class CartView extends StatelessWidget {
  final List<Product> cartItems = []; // Aquí se pueden manejar los productos en el carrito

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('El carrito está vacío'))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return ListTile(
            leading: Image.network(product.imageUrl, width: 50),
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                // Aquí puedes agregar la lógica para eliminar el producto del carrito
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // Aquí puedes agregar la lógica para proceder a pagar
            },
            child: Text('Proceder a Pagar'),
          ),
        ),
      ),
    );
  }
}
