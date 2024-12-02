package com.example.demo.model;


import jakarta.persistence.GenerationType;

@jakarta.persistence.Entity
public class Usuario {
@jakarta.persistence.Id
@jakarta.persistence.GeneratedValue(strategy = GenerationType.IDENTITY)

private Long id;
private String correo;
private String nombre;

public Long getId()
{
     return id;
}

public void setId(Long id)
{
    this.id=id;
}

public String  getNombre()
{
     return nombre;
}

public void setNombre(String nombre)
{
    this.nombre=nombre;
}

public String getCorreo()
{
     return correo;
}

public void setCorreo(String correo)
{
    this.correo=correo;
}
}

