package com.kakolats.shop_app.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ClientUserDTO {
    private String surname;
    private String telephone;
    private String adresse;
    private String email;
    private String login;
    private String password;
}
