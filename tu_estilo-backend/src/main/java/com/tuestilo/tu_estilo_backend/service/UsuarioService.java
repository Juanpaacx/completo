/*package com.tuestilo.tu_estilo_backend.service;

// Importamos la clase Usuario que representa la Entidad
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuestilo.tu_estilo_backend.model.User;
import com.tuestilo.tu_estilo_backend.repository.UsuarioRepositorio;

// Anotamos la clase como un servicio de Spring
@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepositorio usuarioRepository; // Correcto nombre en camelCase

    // Método para obtener todos los usuarios
    public List<User> getAllUsuarios() {
        return usuarioRepository.findAll(); // Cambiado de UsuarioRepository a usuarioRepository
    }

    // Método para obtener un usuario por su ID
    public Optional<User> getUsuarioById(Long id) {
        return usuarioRepository.findById(id); // Cambiado de UsuarioRepository a usuarioRepository
    }

    // Método para guardar un nuevo usuario o actualizar uno existente
    public User saveUsuario(User usuario) {
        return usuarioRepository.save(usuario); // Cambiado de UsuarioRepository a usuarioRepository
    }

    // Método para eliminar un usuario por su ID
    public void deleteUsuario(Long id) {
        usuarioRepository.deleteById(id); // Cambiado de UsuarioRepository a usuarioRepository
    }

    public boolean authenticate(String email, String password) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'authenticate'");
    }
}*/
/*
package com.tuestilo.tu_estilo_backend.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tuestilo.tu_estilo_backend.model.User;
import com.tuestilo.tu_estilo_backend.repository.UsuarioRepositorio;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepositorio usuarioRepository;

    // Método para autenticar un usuario
    public boolean authenticate(String email, String password) {
        Optional<User> usuario = usuarioRepository.findByEmail(email);
        
        // Verifica si el usuario está presente y si la contraseña coincide
        return usuario.isPresent() && usuario.get().getPassword().equals(password);
    }

    // Método para obtener todos los usuarios
    public List<User> getAllUsuarios() {
        return usuarioRepository.findAll();
    }

    // Método para obtener un usuario por su ID
    public Optional<User> getUsuarioById(Long id) {
        return usuarioRepository.findById(id);
    }

    // Método para guardar un nuevo usuario
    public User saveUsuario(User usuario) {
        return usuarioRepository.save(usuario);
    }

    // Método para eliminar un usuario por su ID
    public void deleteUsuario(Long id) {
        usuarioRepository.deleteById(id);
    }
}
*/

package com.tuestilo.tu_estilo_backend.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuestilo.tu_estilo_backend.model.User;
import com.tuestilo.tu_estilo_backend.repository.UsuarioRepositorio;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepositorio usuarioRepository;

    // Método para obtener todos los usuarios
    public List<User> getAllUsuarios() {
        return usuarioRepository.findAll();
    }

    // Método para obtener un usuario por su ID
    public Optional<User> getUsuarioById(Long id) {
        return usuarioRepository.findById(id);
    }

    // Método para guardar un nuevo usuario o actualizar uno existente
    public User saveUsuario(User usuario) {
        return usuarioRepository.save(usuario);
    }

    // Método para eliminar un usuario por su ID
    public void deleteUsuario(Long id) {
        usuarioRepository.deleteById(id);
    }

    // Método para autenticar un usuario con email y contraseña
    public boolean authenticate(String email, String password) {
        Optional<User> user = usuarioRepository.findByEmail(email);
        // Verifica si el usuario existe y si la contraseña coincide
        return user.isPresent() && user.get().getPassword().equals(password);
    }
}
