package com.tuestilo.tu_estilo_backend.config;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**") // Permitir CORS para todas las rutas
                //.allowedOrigins("*") // Cambia según sea necesario
                .allowedOrigins("http://localhost:8080", "http://192.168.100.36", "http://10.10.9.53") 
                .allowedMethods("GET", "POST", "PUT", "DELETE")
                .allowedHeaders("*")
                .allowCredentials(true);
    }
}