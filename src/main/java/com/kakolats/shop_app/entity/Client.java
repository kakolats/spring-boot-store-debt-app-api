package com.kakolats.shop_app.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.kakolats.shop_app.enums.Role;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Builder
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String surname;
    private String telephone;
    private String adresse;
    private Boolean hasAccount=Boolean.FALSE;

    @OneToOne
    @JsonIgnore
    private User user;

    @OneToMany
    private List<Debt> debts;
}
