package com.kakolats.shop_app.service;

import com.kakolats.shop_app.dto.LoginUserDto;
import com.kakolats.shop_app.dto.RegisterUserDto;
import com.kakolats.shop_app.entity.User;
import org.springframework.web.multipart.MultipartFile;

public interface IAuthenticationService {
    User signup(RegisterUserDto input, MultipartFile file);
    User authenticate(LoginUserDto input);
}
