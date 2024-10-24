package com.tuestilo.tu_estilo_backend.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuestilo.tu_estilo_backend.model.User;
import com.tuestilo.tu_estilo_backend.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // Método para autenticar al usuario
    public User authenticate(String email, String password) {
        return userRepository.findByEmailAndPassword(email, password);
    }

    // Nuevo método para obtener todos los usuarios
    public List<User> getAllUsers() {
        return userRepository.findAll(); // Asume que tienes este método en el repositorio
    }
}


