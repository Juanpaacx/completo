package com.example.demo.service;

// Importamos la clase Usuario que representa la Entidad
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Usuario;
import com.example.demo.repository.UsuarioRepositorio;

// Anotamos la clase como un servicio de Spring
@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepositorio usuarioRepository; // Correcto nombre en camelCase

    // Método para obtener todos los usuarios
    public List<Usuario> getAllUsuarios() {
        return usuarioRepository.findAll(); // Cambiado de UsuarioRepository a usuarioRepository
    }

    // Método para obtener un usuario por su ID
    public Optional<Usuario> getUsuarioById(Long id) {
        return usuarioRepository.findById(id); // Cambiado de UsuarioRepository a usuarioRepository
    }

    // Método para guardar un nuevo usuario o actualizar uno existente
    public Usuario saveUsuario(Usuario usuario) {
        return usuarioRepository.save(usuario); // Cambiado de UsuarioRepository a usuarioRepository
    }

    // Método para eliminar un usuario por su ID
    public void deleteUsuario(Long id) {
        usuarioRepository.deleteById(id); // Cambiado de UsuarioRepository a usuarioRepository
    }
}



