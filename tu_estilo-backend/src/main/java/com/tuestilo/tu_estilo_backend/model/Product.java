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
@Table(name = "products") // Nombre de la tabla "products"
public class Product implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // ID autogenerado

    @Column(nullable = false)
    private String name; // Nombre del producto

    @Column(nullable = false)
    private String description; // Descripción del producto

    @Column(nullable = false)
    private Double price; // Precio del producto

    @Column(nullable = false)
    private Integer stock; // Cantidad en stock

    @Column(nullable = false)
    private String size; // Talla del producto

    @Column(nullable = false)
    private String color; // Color del producto

    @Column(name = "image_url", nullable = false)
    private String imageUrl; // URL de la imagen

    @ManyToOne // Relación muchos a uno con Category
    @JoinColumn(name = "category_id", nullable = false) // Clave foránea
    private Category category; // Categoría del producto

    // Constructor vacío
    public Product() {}

    // Constructor con parámetros
    public Product(String name, String description, Double price, Integer stock, String size, String color, String imageUrl, Category category) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.size = size;
        this.color = color;
        this.imageUrl = imageUrl;
        this.category = category;
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}