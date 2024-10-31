/*package com.tuestilo.tu_estilo_backend.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import  org.springframework.data.jpa.repository.Query;
import  org.springframework.stereotype.Repository;

import  com.tuestilo.tu_estilo_backend.model.User;
@Repository
//Definimos la interfaz UsuarioRepository que extiende JpaRepository
//JpaRepository<T,ID> toma dos parámetros: la entidad y el tipo de la clave primaria
public interface  UsuarioRepositorio extends  JpaRepository<User, Long>{
     //JpaRepository ya proporciona métodos CRUD básicos como save, findId, findAll, deleteById, etc.
    //Podemos agregar métodos personalizados si es necesario
    //Nota: tenemos que crearlo en el orden en el que lo estamos realizando
    @Query("SELECT u FROM User u WHERE u.email = ?1")
    User findByEmail(String email);
}
*/

package com.tuestilo.tu_estilo_backend.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.tuestilo.tu_estilo_backend.model.User;

@Repository
public interface UsuarioRepositorio extends JpaRepository<User, Long> {
    // Método para encontrar un usuario por su email
    @Query("SELECT u FROM User u WHERE u.email = ?1")
    Optional<User> findByEmail(String email);
}
