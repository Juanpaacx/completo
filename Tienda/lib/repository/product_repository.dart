import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductRepository {
  final ProductService _productService = ProductService();

  Future<List<Product>> fetchProducts() async {
    return await _productService.fetchProducts();
  }

  Future<void> addProduct(Product product) async {
    await _productService.addProduct(product);
  }

// Si necesitas crear un producto usando addProduct, puedes usar el mismo método o renombrar
// Future<Product> createProduct(Product product) async {
//   await _productService.addProduct(product);
//   return product; // O maneja el retorno de acuerdo a tu lógica
// }
}
