/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/login_view_model.dart'; // Importar el ViewModel para manejar la lógica

class LoginView extends StatelessWidget {
  final _emailController = TextEditingController(); // Controlador para el campo de email
  final _passwordController = TextEditingController(); // Controlador para el campo de password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            Obx(() {
              // Utilizando GetX para manejar el estado de carga
              return Get.find<LoginViewModel>().isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () {
                  String email = _emailController.text.trim();
                  String password = _passwordController.text.trim();
                  Get.find<LoginViewModel>().login(email, password);
                },
                child: Text('Login'),
              );
            }),
            SizedBox(height: 16.0),
            Obx(() {
              // Mostrar un mensaje de error si ocurre
              return Get.find<LoginViewModel>().errorMessage.value != 'Error de conexion PTM'
                  ? Text(
                Get.find<LoginViewModel>().errorMessage.value,
                style: TextStyle(color: Colors.red),
              )
                  : SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
*/
// login_view.dart
// login_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/login_view_model.dart';

class LoginView extends StatelessWidget {
  final LoginViewModel loginController = Get.put(LoginViewModel());

  // Controladores para los campos de texto
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController, // Usar controlador de texto
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            TextField(
              controller: passwordController, // Usar controlador de texto
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            Obx(() => loginController.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      // Pasar los valores de los controladores directamente al método login
                      loginController.login(emailController.text.trim(),
                          passwordController.text.trim());
                    },
                    child: Text('Iniciar Sesión'),
                  )),
            Obx(() => Text(
                  loginController.errorMessage.value,
                  style: TextStyle(color: Colors.red),
                )),
          ],
        ),
      ),
    );
  }
}
