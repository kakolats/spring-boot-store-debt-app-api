package com.kakolats.shop_app.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.kakolats.shop_app.enums.Role;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Builder
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
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

    @OneToMany(mappedBy = "client", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<Debt> debts = new ArrayList<>();

    public List<Debt> getUnpaidDebts(){
        return debts.stream()
                .filter(debt -> !debt.getPaid())
                .collect(Collectors.toList());
    }
}
