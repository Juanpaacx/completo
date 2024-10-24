package com.tuestilo.tu_estilo_backend.model;
import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn; // Asegúrate de que esto esté presente
import jakarta.persistence.ManyToOne; // Importa Serializable
import jakarta.persistence.Table;

@Entity
@Table(name = "users") // Tabla para almacenar los usuarios
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // ID autogenerado

    @Column(nullable = false)
    private String firstName; // Nombre del usuario

    @Column(nullable = false)
    private String lastName; // Apellido del usuario

    @Column(nullable = false, unique = true)
    private String email; // Email único del usuario

    @Column(nullable = false)
    private String password; // Contraseña del usuario

    @Column(nullable = false)
    private String phone; // Teléfono del usuario

    @ManyToOne // Relación muchos a uno con Dirección
    @JoinColumn(name = "address_id", nullable = false) // Clave foránea a la tabla de direcciones
    private Address address; // Dirección del usuario

    public User() {}

    public User(String firstName, String lastName, String email, String password, String phone, Address address) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
}
