/*import 'package:get/get.dart';
import '../services/auth_service.dart'; // Importar el servicio de autenticación
import 'package:tienda/view/home_view.dart';

class LoginViewModel extends GetxController {
  var isLoading = false.obs; // Para manejar el estado de carga
  var errorMessage = ''.obs; // Para mostrar errores

  Future<void> login(String email, String password) async {
    isLoading(true); // Iniciar el estado de carga
    errorMessage(''); // Limpiar el mensaje de error

    try {
      // Intentar hacer login
      bool success = await AuthService().login(email, password);
      if (success) {
        Get.off(HomeView()); // Redirigir al home si es exitoso
      } else {
        errorMessage('Login failed. Please check your credentials.');
      }
    } catch (e) {
      errorMessage('Otra vez el puto error: ${e.toString()}');
    } finally {
      isLoading(false); // Detener el estado de carga
    }
  }
}
*/

// login_view_model.dart
import 'package:get/get.dart';
import '../services/auth_service.dart';
import 'package:tienda/view/home_view.dart';

class LoginViewModel extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  String email = '';
  String password = '';

  Future<void> login(String email, String password) async {
    isLoading(true);
    errorMessage('');

    try {
      bool success = await AuthService().login(email, password);
      if (success) {
        Get.off(HomeView());
      } else {
        errorMessage(
            'Inicio de sesión fallido. Por favor, verifica tus credenciales.');
      }
    } catch (e) {
      errorMessage('Ocurrió un error: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
