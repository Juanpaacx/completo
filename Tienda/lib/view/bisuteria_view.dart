/*import 'package:flutter/material.dart';
import 'product_details_view.dart';

class BisuteriaView extends StatelessWidget {
  final List<Map<String, String>> productos = [
    {
      'nombre': 'Camisa Casual',
      'precio': '25.00',
      'imagen': 'https://via.placeholder.com/150'
    },
    {
      'nombre': 'Jeans Azul',
      'precio': '40.00',
      'imagen': 'https://via.placeholder.com/150'
    },
    {
      'nombre': 'Chaqueta de Cuero',
      'precio': '120.00',
      'imagen': 'https://via.placeholder.com/150'
    },
    {
      'nombre': 'Zapatos Deportivos',
      'precio': '60.00',
      'imagen': 'https://via.placeholder.com/150'
    },
    {
      'nombre': 'Camiseta Estampada',
      'precio': '15.00',
      'imagen': 'https://via.placeholder.com/150'
    },
    {
      'nombre': 'Pantalón de Vestir',
      'precio': '45.00',
      'imagen': 'https://via.placeholder.com/150'
    },
    {
      'nombre': 'Chamarra de Mezclilla',
      'precio': '85.00',
      'imagen': 'https://via.placeholder.com/150'
    },
    {
      'nombre': 'Gorra Deportiva',
      'precio': '20.00',
      'imagen': 'https://via.placeholder.com/150'
    },
    {
      'nombre': 'Sudadera Casual',
      'precio': '50.00',
      'imagen': 'https://via.placeholder.com/150'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bisuteria fresa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Reducir padding para más espacio
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Mostrar 3 productos por fila
            childAspectRatio: 3 / 4, // Tarjetas más compactas
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: productos.length,
          itemBuilder: (context, index) {
            final producto = productos[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsView(
                      nombre: producto['nombre']!,
                      precio: producto['precio']!,
                      imagen: producto['imagen']!,
                      description: producto['description']!,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 3.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(producto['imagen']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        producto['nombre']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14, // Tamaño de texto más pequeño
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '\$${producto['precio']}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.green,
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
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:tienda/models/product_model.dart';
import 'package:tienda/services/product_service.dart';
import 'product_details_view.dart';

class BisuteriaView extends StatefulWidget {
  @override
  _BisuteriaViewState createState() => _BisuteriaViewState();
}

class _BisuteriaViewState extends State<BisuteriaView> {
  List<Product> productos = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  // Método para obtener productos de la categoría "Bisutería"
  Future<void> _fetchProducts() async {
    try {
      final productosBisuteria = await ProductService().getProductsByCategory(
          3); // Asegúrate de usar el ID correcto para "Bisutería"
      setState(() {
        productos = productosBisuteria;
      });
    } catch (e) {
      print('Error al cargar productos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bisutería'),
      ),
      body: productos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Mostrar 3 productos por fila
                  childAspectRatio: 3 / 4, // Tarjetas más compactas
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  final producto = productos[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsView(
                            nombre: producto.name,
                            precio: producto.price.toString(),
                            imagen: producto.imageUrl,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(producto.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              producto.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '\$${producto.price}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.green,
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
    );
  }
}
