package com.tuestilo.tu_estilo_backend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuestilo.tu_estilo_backend.model.Category;
import com.tuestilo.tu_estilo_backend.repository.CategoryRepository;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    // Método para obtener todas las categorías
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    // Método para obtener una categoría por su ID
    public Category getCategoryById(Long id) {
        return categoryRepository.findById(id).orElse(null);
    }

    // Método para agregar o actualizar una categoría
    public Category saveCategory(Category category) {
        return categoryRepository.save(category);
    }

    // Método para eliminar una categoría
    public void deleteCategory(Long id) {
        categoryRepository.deleteById(id);
    }
}
