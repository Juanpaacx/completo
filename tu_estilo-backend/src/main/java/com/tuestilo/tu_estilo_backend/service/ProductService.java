package com.tuestilo.tu_estilo_backend.service;

import com.tuestilo.tu_estilo_backend.model.Product;
import com.tuestilo.tu_estilo_backend.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public void save(Product product) {
        productRepository.save(product);
    }
}
