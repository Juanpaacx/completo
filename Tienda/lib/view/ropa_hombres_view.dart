/*import 'package:flutter/material.dart';
import 'product_details_view.dart'; // Pantalla de detalles del producto

class RopaHombresView extends StatelessWidget {
  final List<Map<String, String>> productos = [
    {
      'nombre': 'Camisa Casual',
      'precio': '25.00',
      'imagen': 'https://via.placeholder.com/150',
      'description':
          'Camisa casual de manga larga, ideal para eventos informales.',
    },
    {
      'nombre': 'Jeans Azul',
      'precio': '40.00',
      'imagen':
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fmichelblanc.mx%2Fproducts%2Fcamisa-azul&psig=AOvVaw0eKRa-mGiQ_st2CMJBUQLj&ust=1730482568696000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIDY396UuYkDFQAAAAAdAAAAABAE',
      'description': 'Jeans de corte recto, color azul oscuro, estilo clásico.',
    },
    {
      'nombre': 'Chaqueta de Cuero',
      'precio': '120.00',
      'imagen': 'https://via.placeholder.com/150',
      'description':
          'Chaqueta de cuero auténtico con acabado mate, resistente y a la moda.',
    },
    {
      'nombre': 'Zapatos Deportivos',
      'precio': '60.00',
      'imagen': 'https://via.placeholder.com/150',
      'description':
          'Zapatos deportivos cómodos y ligeros, ideales para correr.',
    },
    {
      'nombre': 'Camiseta Estampada',
      'precio': '15.00',
      'imagen': 'https://via.placeholder.com/150',
      'description':
          'Camiseta de algodón con estampado original, ideal para el verano.',
    },
    {
      'nombre': 'Pantalón de Vestir',
      'precio': '45.00',
      'imagen': 'https://via.placeholder.com/150',
      'description':
          'Pantalón de vestir elegante, ideal para ocasiones formales.',
    },
    {
      'nombre': 'Chamarra de Mezclilla',
      'precio': '85.00',
      'imagen': 'https://via.placeholder.com/150',
      'description':
          'Chamarra de mezclilla con bolsillos delanteros, estilo vintage.',
    },
    {
      'nombre': 'Gorra Deportiva',
      'precio': '20.00',
      'imagen': 'https://via.placeholder.com/150',
      'description': 'Gorra deportiva ajustable, ligera y cómoda.',
    },
    {
      'nombre': 'Sudadera Casual',
      'precio': '50.00',
      'imagen': 'https://via.placeholder.com/150',
      'description': 'Sudadera con capucha, perfecta para el invierno.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ropa para Hombres'),
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
import 'dart:convert';
import 'package:http/http.dart' as http;

class RopaHombresView extends StatelessWidget {
  // URL de tu API que devuelve los productos
  final String apiUrl = "http://172.16.0.130:8080/api/products"; //

  // Función para obtener productos desde la API
  Future<List<Map<String, dynamic>>> fetchProductos() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      // Convertimos cada producto en Map<String, dynamic>
      return data
          .map((producto) => Map<String, dynamic>.from(producto))
          .toList();
    } else {
      throw Exception('Error al cargar productos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ropa para Hombres'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchProductos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay productos disponibles.'));
          } else {
            final productos = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  final producto = productos[index];
                  return GestureDetector(
                    /*onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsView(
                            nombre: producto['nombre'],
                            precio: producto['precio'],
                            imagen: producto['imagen'],
                            description: producto['description'],
                          ),
                        ),
                      );
                    },*/
                    child: Card(
                      elevation: 3.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(producto['imagen']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              producto['nombre'],
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
            );
          }
        },
      ),
    );
  }
}
