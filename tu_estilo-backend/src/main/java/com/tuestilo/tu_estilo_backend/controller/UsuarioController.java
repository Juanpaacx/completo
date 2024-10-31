/*package com.tuestilo.tu_estilo_backend.controller;
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

import com.tuestilo.tu_estilo_backend.model.User;
import com.tuestilo.tu_estilo_backend.service.UsuarioService;
*/
/**
 * Controlador REST para gestionar las operaciones CRUD de usuarios
 */
/* */
/*
@RestController
// Definimos la ruta base para los endpoints de este controlador
@RequestMapping("/api/users")
public class UsuarioController {

    // Inyectamos el servicio de usuarios
    @Autowired
    private UsuarioService usuarioService;

    // Endpoint para obtener todos los usuarios
    @GetMapping
    public List<User> getAllUsuarios() {
        return usuarioService.getAllUsuarios();
    }

    // Endpoint para obtener un usuario por su ID
    @GetMapping("/{id}")
    public ResponseEntity<com.tuestilo.tu_estilo_backend.model.User> getUsuarioById(@PathVariable Long id) {
        Optional<com.tuestilo.tu_estilo_backend.model.User> usuario = usuarioService.getUsuarioById(id);
        // Si el usuario existe, se devuelve, de lo contrario se retorna un 404
        return usuario.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Endpoint para crear un nuevo usuario
    @PostMapping
    public ResponseEntity<com.tuestilo.tu_estilo_backend.model.User> createUsuario(@RequestBody com.tuestilo.tu_estilo_backend.model.User usuario) {
        // Llamamos al servicio para guardar el nuevo usuario
        com.tuestilo.tu_estilo_backend.model.User nuevoUsuario = usuarioService.saveUsuario(usuario);
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
*/
/*package com.tuestilo.tu_estilo_backend.controller;

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

import com.tuestilo.tu_estilo_backend.model.User;
import com.tuestilo.tu_estilo_backend.model.LoginRequest; // Importar la clase LoginRequest
import com.tuestilo.tu_estilo_backend.service.UsuarioService;

@RestController
@RequestMapping("/api/users")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    // Otros endpoints que ya tienes...

    // Endpoint para autenticar usuarios (login)
    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody LoginRequest loginRequest) {
        boolean isAuthenticated = usuarioService.authenticate(loginRequest.getEmail(), loginRequest.getPassword());

        if (isAuthenticated) {
            return ResponseEntity.ok("Login exitoso");
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Credenciales incorrectas");
        }
    }

    // Endpoint para obtener todos los usuarios
    @GetMapping
    public List<User> getAllUsuarios() {
        return usuarioService.getAllUsuarios();
    }

    // Endpoint para obtener un usuario por su ID
    @GetMapping("/{id}")
    public ResponseEntity<User> getUsuarioById(@PathVariable Long id) {
        Optional<User> usuario = usuarioService.getUsuarioById(id);
        return usuario.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Endpoint para crear un nuevo usuario
    @PostMapping
    public ResponseEntity<User> createUsuario(@RequestBody User usuario) {
        User nuevoUsuario = usuarioService.saveUsuario(usuario);
        return new ResponseEntity<>(nuevoUsuario, HttpStatus.CREATED);
    }

    // Endpoint para eliminar un usuario por su ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUsuario(@PathVariable Long id) {
        usuarioService.deleteUsuario(id);
        return ResponseEntity.noContent().build();
    }
}
    */
/*
package com.tuestilo.tu_estilo_backend.controller;
@RestController
@RequestMapping("/api/users")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    // Endpoint para obtener todos los usuarios
    @GetMapping
    public List<User> getAllUsuarios() {
        return usuarioService.getAllUsuarios();
    }

    // Endpoint para obtener un usuario por su ID
    @GetMapping("/{id}")
    public ResponseEntity<User> getUsuarioById(@PathVariable Long id) {
        Optional<User> usuario = usuarioService.getUsuarioById(id);
        return usuario.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Endpoint para crear un nuevo usuario
    @PostMapping
    public ResponseEntity<User> createUsuario(@RequestBody User usuario) {
        User nuevoUsuario = usuarioService.saveUsuario(usuario);
        return new ResponseEntity<>(nuevoUsuario, HttpStatus.CREATED);
    }

    // Endpoint para eliminar un usuario por su ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUsuario(@PathVariable Long id) {
        usuarioService.deleteUsuario(id);
        return ResponseEntity.noContent().build();
    }
}
*/
package com.tuestilo.tu_estilo_backend.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tuestilo.tu_estilo_backend.model.User;
import com.tuestilo.tu_estilo_backend.service.UsuarioService;

@RestController
@RequestMapping("/api/users")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    // Endpoint para obtener todos los usuarios
    @GetMapping
    public ResponseEntity<List<User>> getAllUsuarios() {
        List<User> usuarios = usuarioService.getAllUsuarios();
        return new ResponseEntity<>(usuarios, HttpStatus.OK);
    }

    // Endpoint para obtener un usuario por su ID
    @GetMapping("/{id}")
    public ResponseEntity<User> getUsuarioById(@PathVariable Long id) {
        Optional<User> usuario = usuarioService.getUsuarioById(id);
        return usuario.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Endpoint para crear un nuevo usuario
    @PostMapping
    public ResponseEntity<User> createUsuario(@Valid @RequestBody User usuario) {
        try {
            User nuevoUsuario = usuarioService.saveUsuario(usuario);
            return new ResponseEntity<>(nuevoUsuario, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
    }

    // Endpoint para actualizar un usuario existente
    @PutMapping("/{id}")
    public ResponseEntity<User> updateUsuario(@PathVariable Long id, @Valid @RequestBody User usuario) {
        Optional<User> usuarioExistente = usuarioService.getUsuarioById(id);
        if (usuarioExistente.isPresent()) {
            usuario.setId(id); // Asegúrate de que el ID esté configurado correctamente
            User usuarioActualizado = usuarioService.saveUsuario(usuario);
            return new ResponseEntity<>(usuarioActualizado, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Endpoint para eliminar un usuario por su ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUsuario(@PathVariable Long id) {
        Optional<User> usuarioExistente = usuarioService.getUsuarioById(id);
        if (usuarioExistente.isPresent()) {
            usuarioService.deleteUsuario(id);
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
