package com.kakolats.shop_app.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class RegisterUserDto {
    private String email;
    private String password;
    private String login;
}
