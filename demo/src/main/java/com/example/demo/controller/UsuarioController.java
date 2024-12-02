package com.example.demo.controller;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Usuario;
import com.example.demo.service.UsuarioService;

/**
 * Controlador REST para gestionar las operaciones CRUD de usuarios
 */
@RestController
// Definimos la ruta base para los endpoints de este controlador
@RequestMapping("/api/usuario")
public class UsuarioController {

    // Inyectamos el servicio de usuarios
    @Autowired
    private UsuarioService usuarioService;

    // Endpoint para obtener todos los usuarios
    @GetMapping
    public List<Usuario> getAllUsuarios() {
        return usuarioService.getAllUsuarios();
    }

    // Endpoint para obtener un usuario por su ID
    @GetMapping("/{id}")
    public ResponseEntity<com.example.demo.model.Usuario> getUsuarioById(@PathVariable Long id) {
        Optional<com.example.demo.model.Usuario> usuario = usuarioService.getUsuarioById(id);
        // Si el usuario existe, se devuelve, de lo contrario se retorna un 404
        return usuario.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Endpoint para crear un nuevo usuario
    @PostMapping
    public ResponseEntity<com.example.demo.model.Usuario> createUsuario(@RequestBody com.example.demo.model.Usuario usuario) {
        // Llamamos al servicio para guardar el nuevo usuario
        com.example.demo.model.Usuario nuevoUsuario = usuarioService.saveUsuario(usuario);
        // Retornamos la entidad creada con un status 201 (CREATED)
        return new ResponseEntity<>(nuevoUsuario, HttpStatus.CREATED);
    }

    // Endpoint para eliminar un usuario por su ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUsuario(@PathVariable Long id) {
        // Llamamos al servicio para eliminar el usuario por su ID
        usuarioService.deleteUsuario(id);
        // Retornamos una respuesta sin contenido
        return ResponseEntity.noContent().build();
    }
}
