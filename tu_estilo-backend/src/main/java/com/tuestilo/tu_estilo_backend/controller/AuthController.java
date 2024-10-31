/*package com.tuestilo.tu_estilo_backend.controller;

import com.tuestilo.tu_estilo_backend.model.LoginRequest;
import com.tuestilo.tu_estilo_backend.model.User; // Asegúrate de que esto esté importado
import com.tuestilo.tu_estilo_backend.repository.UsuarioRepositorio; // Asegúrate de tener este repositorio
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private UsuarioRepositorio usuarioRepositorio; // Corregido: no debe tener punto y coma

    @PostMapping("/login")
    public String login(@RequestBody LoginRequest loginRequest) {
        // Busca al usuario por email
        User user = usuarioRepositorio.findByEmail(loginRequest.getEmail()) // Cambiado a 'usuarioRepositorio'
                                  .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        // Verifica la contraseña
        if (!user.getPassword().equals(loginRequest.getPassword())) {
            throw new RuntimeException("Contraseña incorrecta");
        }

        // Aquí iría la lógica para manejar el inicio de sesión (ej. generar un token JWT)
        return "Inicio de sesión exitoso";
    }
}
*/