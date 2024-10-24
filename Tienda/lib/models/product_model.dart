import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String size;
  final String color;
  final String imageUrl;
  final Category category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.size,
    required this.color,
    required this.imageUrl,
    required this.category,
  });

  // Factory constructor para crear una instancia de Product desde un JSON
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  // Método para convertir la instancia de Product a JSON
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

// Clase Category simplificada para manejar la relación con productos
@JsonSerializable()
class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
