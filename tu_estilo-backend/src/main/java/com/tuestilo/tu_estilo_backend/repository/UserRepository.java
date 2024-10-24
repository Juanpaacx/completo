package com.tuestilo.tu_estilo_backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tuestilo.tu_estilo_backend.model.User;


public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmailAndPassword(String email, String password);
}

