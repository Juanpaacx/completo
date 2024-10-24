package com.tuestilo.tu_estilo_backend.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tuestilo.tu_estilo_backend.model.OrderItem;
import com.tuestilo.tu_estilo_backend.repository.OrderItemRepository;

@Service
public class OrderItemService {

    private final OrderItemRepository orderItemRepository;

    public OrderItemService(OrderItemRepository orderItemRepository) {
        this.orderItemRepository = orderItemRepository;
    }

    public List<OrderItem> findAll() {
        return orderItemRepository.findAll();
    }

    public OrderItem findById(Long id) {
        return orderItemRepository.findById(id).orElse(null);
    }

    public OrderItem save(OrderItem orderItem) {
        return orderItemRepository.save(orderItem);
    }

    public void delete(Long id) {
        orderItemRepository.deleteById(id);
    }
}
