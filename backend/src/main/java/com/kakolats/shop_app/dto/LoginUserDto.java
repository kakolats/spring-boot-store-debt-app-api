package com.kakolats.shop_app.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class LoginUserDto {
    private String login;
    private String password;
}
