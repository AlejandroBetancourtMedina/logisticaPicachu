package com.logistica.logisticaPicachu.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
public class Cliente {

    @Id
    String rut;

    String nombre;

    @Column(name = "ap_paterno")
    String apellidoPaterno;

    @Column(name = "ap_materno")
    String apellidoMaterno;

    String domicilio;
    String region;
    String comuna;
    String email;
}
