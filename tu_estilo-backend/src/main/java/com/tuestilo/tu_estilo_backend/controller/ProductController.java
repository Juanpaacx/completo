package com.tuestilo.tu_estilo_backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tuestilo.tu_estilo_backend.model.Product;
import com.tuestilo.tu_estilo_backend.repository.ProductRepository;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    // Obtener todos los productos
    @GetMapping
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    // Obtener un producto por ID
    @GetMapping("/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable Long id) {
        return productRepository.findById(id)
                .map(product -> ResponseEntity.ok().body(product))
                .orElse(ResponseEntity.notFound().build());
    }
/* 
    // Crear un nuevo producto
    @PostMapping
    public ResponseEntity<String> createProduct(@RequestBody Product product) {
        try {
            validateImageUrl(product.getImageUrl());
            Product savedProduct = productRepository.save(product);
            return ResponseEntity.status(HttpStatus.CREATED).body("Producto creado con ID: " + savedProduct.getId());
        } catch (MalformedURLException e) {
            return ResponseEntity.badRequest().body("URL de imagen inválida: " + e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al crear el producto: " + e.getMessage());
        }
    }

    // Actualizar un producto existente
    @PutMapping("/{id}")
    public ResponseEntity<String> updateProduct(@PathVariable Long id, @RequestBody Product productDetails) {
        return productRepository.findById(id)
                .map(product -> {
                    try {
                        validateImageUrl(productDetails.getImageUrl());
                        product.setName(productDetails.getName());
                        product.setDescription(productDetails.getDescription());
                        product.setPrice(productDetails.getPrice());
                        product.setImageUrl(productDetails.getImageUrl());
                        product.setCategory(productDetails.getCategory());
                        productRepository.save(product);
                        return ResponseEntity.ok("Producto actualizado con ID: " + product.getId());
                    } catch (MalformedURLException e) {
                        return ResponseEntity.badRequest().body("URL de imagen inválida: " + e.getMessage());
                    }
                })
                .orElse(ResponseEntity.notFound().build());
    }*/
/* 
    // Método para validar la URL de la imagen
    private void validateImageUrl(String imageUrl) throws MalformedURLException {
        new URL(imageUrl); // Intenta crear una URL para verificar que es válida
    */
}
