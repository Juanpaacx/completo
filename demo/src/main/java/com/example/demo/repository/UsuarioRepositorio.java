package com.example.demo.repository;
//Importamos la clase del Usuario que representará la Entidad
//Importamos la interfaz JPA CRUD

import  org.springframework.data.jpa.repository.JpaRepository;
import  org.springframework.stereotype.Repository;

import  com.example.demo.model.Usuario;
@Repository
//Definimos la interfaz UsuarioRepository que extiende JpaRepository
//JpaRepository<T,ID> toma dos parámetros: la entidad y el tipo de la clave primaria
public interface  UsuarioRepositorio extends  JpaRepository<Usuario, Long>{
     //JpaRepository ya proporciona métodos CRUD básicos como save, findId, findAll, deleteById, etc.
    //Podemos agregar métodos personalizados si es necesario
    //Nota: tenemos que crearlo en el orden en el que lo estamos realizando
}

