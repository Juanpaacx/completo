package com.tuestilo.tu_estilo_backend.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tuestilo.tu_estilo_backend.model.Address;
import com.tuestilo.tu_estilo_backend.service.AddressService;

@RestController
@RequestMapping("/api/addresses") // Ruta base para el controlador de Direcciones
public class AddressController {

    @Autowired
    private AddressService direccionService;

    // Obtener todas las direcciones
    @GetMapping
    public ResponseEntity<List<Address>> getAllAddresses() {
        List<Address> addresses = direccionService.getAllAddresses();
        return ResponseEntity.ok(addresses);
    }

    // Obtener una dirección por ID
    @GetMapping("/{id}")
    public ResponseEntity<Address> getAddressById(@PathVariable Long id) {
        Optional<Address> direccion = direccionService.getAddressById(id);
        if (direccion.isPresent()) {
            return ResponseEntity.ok(direccion.get());
        } else {
            return ResponseEntity.notFound().build(); // Si no se encuentra, devolver 404
        }
    }

    // Crear una nueva dirección
    @PostMapping
    public ResponseEntity<Address> createAddress(@RequestBody Address direccion) {
        Address nuevaDireccion = direccionService.createAddress(direccion);
        return ResponseEntity.status(201).body(nuevaDireccion); // Devolver la dirección creada con status 201
    }

    // Actualizar una dirección existente
    @PutMapping("/{id}")
    public ResponseEntity<Address> updateAddress(@PathVariable Long id, @RequestBody Address direccion) {
        Optional<Address> direccionExistente = direccionService.getAddressById(id);
        if (direccionExistente.isPresent()) {
            Address direccionActualizada = direccionService.updateAddress(id, direccion);
            return ResponseEntity.ok(direccionActualizada); // Devolver la dirección actualizada
        } else {
            return ResponseEntity.notFound().build(); // Si no se encuentra, devolver 404
        }
    }

    // Eliminar una dirección
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteAddress(@PathVariable Long id) {
        boolean deleted = direccionService.deleteAddress(id);
        if (deleted) {
            return ResponseEntity.noContent().build(); // Devolver 204 No Content si se elimina
        } else {
            return ResponseEntity.notFound().build(); // Si no se encuentra, devolver 404
        }
    }
}
