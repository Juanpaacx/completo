import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  final String nombre;
  final String precio;
  final String imagen;

  const ProductDetailsView({
    Key? key,
    required this.nombre,
    required this.precio,
    required this.imagen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imagen,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null)
                  return child; // La imagen se ha cargado
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Text('Error al cargar la imagen');
              },
            ),
            SizedBox(height: 20),
            Text(
              'Precio: \$${precio}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
