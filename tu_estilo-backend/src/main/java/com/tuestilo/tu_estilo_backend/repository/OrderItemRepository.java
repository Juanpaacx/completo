package com.tuestilo.tu_estilo_backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tuestilo.tu_estilo_backend.model.OrderItem;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
    // Puedes añadir métodos de consulta personalizados aquí si es necesario
}
