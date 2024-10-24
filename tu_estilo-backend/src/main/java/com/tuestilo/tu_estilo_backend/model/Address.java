package com.tuestilo.tu_estilo_backend.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "addresses") // Nombre de la tabla "addresses"
public class Address implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // ID autogenerado

    @Column(nullable = false)
    private String street; // Calle

    @Column(nullable = false)
    private String city; // Ciudad

    @Column(nullable = false)
    private String state; // Estado o provincia

    @Column(nullable = false)
    private String country; // País

    @Column(nullable = false)
    private String postalCode; // Código Postal

    @Column(nullable = true)
    private String additionalInfo; // Información adicional como número de apartamento, etc.

    // Constructor vacío
    public Address() {}

    // Constructor con parámetros
    public Address(String street, String city, String state, String country, String postalCode, String additionalInfo) {
        this.street = street;
        this.city = city;
        this.state = state;
        this.country = country;
        this.postalCode = postalCode;
        this.additionalInfo = additionalInfo;
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getAdditionalInfo() {
        return additionalInfo;
    }

    public void setAdditionalInfo(String additionalInfo) {
        this.additionalInfo = additionalInfo;
    }
}
