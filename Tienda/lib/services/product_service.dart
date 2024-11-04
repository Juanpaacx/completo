/*import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  final String baseUrl =
      "http://192.168.100.34:8080/api/products"; // URL de tu API

  // Método para obtener los productos
  Future<List<Product>> fetchProducts() async {
    http.Client client = http.Client();
    try {
      final response = await client.get(
        Uri.parse(baseUrl),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin":
              "*", // Añadir header para permitir cualquier origen
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => Product.fromJson(item)).toList();
      } else {
        print("Error: ${response.statusCode}");
        throw Exception(
            "Error al cargar los productos: ${response.statusCode}");
      }
    } catch (e) {
      print("Error de conexión: $e");
      throw Exception("Error de conexión: $e");
    } finally {
      client.close();
    }
  }

  // Método para añadir un producto
  Future<void> addProduct(Product product) async {
    http.Client client = http.Client();
    try {
      final response = await client.post(
        Uri.parse(baseUrl),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*", // Añadir header para pruebas
        },
        body: jsonEncode(product.toJson()),
      );

      if (response.statusCode != 201) {
        throw Exception("Error al añadir producto: ${response.statusCode}");
      }
    } catch (e) {
      print("Error de conexión: $e");
      throw Exception("Error de conexión: $e");
    } finally {
      client.close();
    }
  }
}
*/

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  final String baseUrl =
      "http://192.168.100.34:8080/api/products"; // URL de tu API

  // Método para obtener todos los productos
  Future<List<Product>> fetchProducts() async {
    final client = http.Client();
    try {
      final response = await client.get(
        Uri.parse(baseUrl),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*", // Permitir cualquier origen
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => Product.fromJson(item)).toList();
      } else {
        print("Error: ${response.statusCode}");
        throw Exception(
            "Error al cargar los productos: ${response.statusCode}");
      }
    } catch (e) {
      print("Error de conexión: $e");
      throw Exception("Error de conexión: $e");
    } finally {
      client.close();
    }
  }

  // Método para añadir un producto
  Future<void> addProduct(Product product) async {
    final client = http.Client();
    try {
      final response = await client.post(
        Uri.parse(baseUrl),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*", // Permitir cualquier origen
        },
        body: jsonEncode(product.toJson()),
      );

      if (response.statusCode != 201) {
        throw Exception("Error al añadir producto: ${response.statusCode}");
      }
    } catch (e) {
      print("Error de conexión: $e");
      throw Exception("Error de conexión: $e");
    } finally {
      client.close();
    }
  }

  // Método para obtener productos por categoría
  Future<List<Product>> getProductsByCategory(int categoryId) async {
    final client = http.Client();
    try {
      final url = Uri.parse('$baseUrl/category/$categoryId');
      final response = await client.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*", // Permitir cualquier origen
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((dynamic item) => Product.fromJson(item)).toList();
      } else {
        throw Exception(
            "Error al cargar productos de la categoría: ${response.statusCode}");
      }
    } catch (e) {
      print("Error de conexión: $e");
      throw Exception("Error de conexión: $e");
    } finally {
      client.close();
    }
  }
}
