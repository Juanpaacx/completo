import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tienda/services/auth_service.dart'; // Asegúrate de tener este archivo en tu proyecto
import 'package:tienda/view/home_view.dart'; // Pantalla a mostrar tras login exitoso

class AuthController extends GetxController {
  var isLoggedIn = false.obs; // Observa el estado de login
  var isLoading = false.obs; // Observa el estado de carga

  final emailController = TextEditingController(); // Controlador para el email
  final passwordController = TextEditingController(); // Controlador para la contraseña

  // Método para iniciar sesión
  void login(String email, String password) async {
    try {
      isLoading(true);
      // Aquí haces la solicitud de autenticación a tu API
      var success = await AuthService().login(email, password); // Supongamos que este método existe en tu servicio

      if (success) {
        // Si la autenticación es exitosa, navega a la pantalla de lista de productos
        Get.offAll(() => HomeView()); // Redirige a ProductListView
      } else {
        Get.snackbar(
          'Error',
          'Email o contraseña incorrectos',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Ha ocurrido un error. Inténtalo nuevamente.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  // Método para cerrar sesión
  void logout() {
    // Aquí puedes limpiar los datos del usuario o los tokens de autenticación
    // Por ejemplo, eliminando el token almacenado localmente
    // O reseteando los valores relacionados con el usuario

    // Redirigir al login
    Get.offAllNamed('/login_view');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
