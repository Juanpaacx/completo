package com.tuestilo.tu_estilo_backend.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tuestilo.tu_estilo_backend.model.Address;
import com.tuestilo.tu_estilo_backend.repository.AddressRepository;

@Service
public class AddressService {

    @Autowired
    private AddressRepository direccionRepository;

    // Obtener todas las direcciones
    public List<Address> getAllAddresses() {
        return direccionRepository.findAll();
    }

    // Obtener una dirección por su ID
    public Optional<Address> getAddressById(Long id) {
        return direccionRepository.findById(id);
    }

    // Crear una nueva dirección
    public Address createAddress(Address direccion) {
        return direccionRepository.save(direccion);
    }

    // Actualizar una dirección existente
    public Address updateAddress(Long id, Address direccion) {
        direccion.setId(id); // Asegurarse de que el ID sea el correcto para actualizar
        return direccionRepository.save(direccion);
    }

    // Eliminar una dirección por su ID
    public boolean deleteAddress(Long id) {
        Optional<Address> direccion = direccionRepository.findById(id);
        if (direccion.isPresent()) {
            direccionRepository.deleteById(id);
            return true;
        }
        return false; // Devolver false si la dirección no se encontró
    }
}
