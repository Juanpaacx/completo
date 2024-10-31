import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda/view/home_view.dart';
import 'view/login_view.dart'; // Importa la pantalla LoginView
import 'view_model/login_view_model.dart'; // Controlador del Login
import 'view_model/product_view_model.dart'; // Controlador de productos
import 'view_model/auth_controller.dart'; // Controlador de autenticación
import 'view/home_view.dart';

void main() {
  // Registra los controladores antes de ejecutar la aplicación
  Get.put(AuthController()); // Controlador de autenticación
  Get.put(ProductController()); // Controlador de productos
  Get.put(LoginViewModel()); // Aquí se registra el LoginViewModel

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Cambiado a GetMaterialApp para usar GetX
      debugShowCheckedModeBanner: false,
      title: 'Tu estilo, tu camino',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(), // Aquí indicamos que LoginView será la pantalla inicial
    );
  }
}
