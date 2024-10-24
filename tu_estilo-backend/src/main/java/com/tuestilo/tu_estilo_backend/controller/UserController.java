package com.tuestilo.tu_estilo_backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tuestilo.tu_estilo_backend.model.User;
import com.tuestilo.tu_estilo_backend.service.UserService;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    // Método para obtener todos los usuarios
    @GetMapping
    public List<User> getAllUsers() {
        return userService.getAllUsers(); // Este método debe estar en el servicio
    }
}
