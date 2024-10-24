import 'package:get/get.dart';
import '../models/product_model.dart';
import '../repository/product_repository.dart';

class ProductController extends GetxController {
  final ProductRepository productRepository = ProductRepository();
  var productList = <Product>[].obs; // Lista observada de productos
  var isLoading = true.obs; // Variable para controlar el estado de carga

  @override
  void onInit() {
    fetchProducts(); // Llamar a la función para cargar los productos al iniciar
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true); // Comienza la carga
      productList.value = await productRepository.fetchProducts();
    } catch (e) {
      print('Error al cargar productos: $e');
    } finally {
      isLoading(false); // Termina la carga
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      await productRepository.addProduct(product); // Asegúrate de usar el método correcto
      productList.add(product); // Agrega el nuevo producto a la lista
    } catch (e) {
      print('Error al agregar producto: $e');
    }
  }

// Otros métodos (updateProduct, deleteProduct, etc.)...
}
