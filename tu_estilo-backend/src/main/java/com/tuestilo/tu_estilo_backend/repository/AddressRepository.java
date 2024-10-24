package com.tuestilo.tu_estilo_backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tuestilo.tu_estilo_backend.model.Address;

@Repository
public interface AddressRepository extends JpaRepository<Address, Long> {
}
