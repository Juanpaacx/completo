package com.tuestilo.tu_estilo_backend.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration; // Asegúrate de importar esta clase
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration // Añade esta anotación
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable()) // Desactiva CSRF
            .cors(cors -> cors.disable()) //desactiva cors
            .authorizeHttpRequests(auth -> auth
                .anyRequest().permitAll() // Permite acceso sin autenticación a cualquier solicitud
            );

        return http.build();
    }
}
