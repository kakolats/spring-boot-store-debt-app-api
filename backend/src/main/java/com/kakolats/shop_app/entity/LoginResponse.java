package com.kakolats.shop_app.entity;

import com.kakolats.shop_app.enums.Role;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class LoginResponse {
    private String token;
    private long expiresIn;
    private Role role;
}
