package com.kakolats.shop_app.dto;

import com.kakolats.shop_app.entity.Debt;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClientDTO implements Serializable {
    private Long Id;
    private String surname;
    private String telephone;
    private String adresse;
    private Boolean hasAccount;
    private Integer cumulDettes;
}
