package com.logistica.logisticaPicachu.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
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

    @NotNull (message = "Debe completar el campo")
    @Size(max = 20, message = "El campo no debe exceder de los 20 caracteres")
    String nombre;

    @Column(name = "ap_paterno")
    @NotNull (message = "Debe completar el campo")
    @Size (max = 20 , message = "El campo no debe exceder de los 20 caracteres")
    String apellidoPaterno;

    @Column(name = "ap_materno")
    @NotNull (message = "Debe completar el campo")
    @Size (max = 20, message = "El campo no debe exceder de los 20 caracteres")
    String apellidoMaterno;

    @NotNull (message = "Debe completar el campo")
    @Size (max = 50, message = "El campo no debe exceder de los 20 caracteres")
    String domicilio;

    @NotNull (message = "Debe completar el campo")
    String region;

    @NotNull (message = "Debe completar el campo")
    String comuna;

    @NotNull (message = "Debe completar el campo")
    @Size (max = 60, message = "El campo no debe exceder de los 20 caracteres")
    String email;
}
