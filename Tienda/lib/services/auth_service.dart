import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl =
      "http://10.50.32.20:8080/api/users"; // Cambia la URL según tu backend
// 172.27.160.1
  // 192.168.100.36
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl), // Endpoint de login
        headers: {"Content-Type": "application/json"},
      );
      print(response.body);
      if (response.statusCode == 200) {
        // Si la respuesta es exitosa, retorna true
        return true;
      } else {
        // Si falla, retorna false
        return false;
      }
    } catch (e) {
      print('Mensaje de error ' + e.toString());
      return Future.value(false);
    }
  }

  Future<bool> register(String email, String password, String nombre) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'), // Endpoint de registro
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email': email,
        'password': password,
        'nombre': nombre, // Añadido el campo nombre
      }),
    );

    if (response.statusCode == 201) {
      // Si el registro fue exitoso (201 Created), retorna true
      return true;
    } else {
      // Si falla, retorna false
      return false;
    }
  }

  Future<void> logout() async {
    final response = await http.post(
      Uri.parse('$baseUrl/logout'), // Endpoint de logout
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception('Error al cerrar sesión');
    }
  }
}
