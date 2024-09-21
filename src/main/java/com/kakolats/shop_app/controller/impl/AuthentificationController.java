package com.kakolats.shop_app.controller.impl;

import com.kakolats.shop_app.dto.LoginUserDto;
import com.kakolats.shop_app.dto.RegisterUserDto;
import com.kakolats.shop_app.entity.LoginResponse;
import com.kakolats.shop_app.entity.User;
import com.kakolats.shop_app.enums.Role;
import com.kakolats.shop_app.service.impl.AuthenticationService;
import com.kakolats.shop_app.service.impl.JwtService;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Log4j2
@RequestMapping("/auth")
@RestController
public class AuthentificationController {
    private final JwtService jwtService;

    private final AuthenticationService authentificationService;

    public AuthentificationController(JwtService jwtService, AuthenticationService authenticationService) {
        this.jwtService = jwtService;
        this.authentificationService = authenticationService;
    }

    @PostMapping(value = "/signup", consumes = {"multipart/form-data"})
    public ResponseEntity<User> register(@RequestPart("user") RegisterUserDto registerUserDto,@RequestPart("file") MultipartFile file) {
        registerUserDto.setRole(Role.BOUTIQUIER);
        User registeredUser = authentificationService.signup(registerUserDto,file);
        return ResponseEntity.ok(registeredUser);
    }

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> authenticate(@RequestBody LoginUserDto loginUserDto) {
        User authenticatedUser = authentificationService.authenticate(loginUserDto);

        String jwtToken = jwtService.generateToken(authenticatedUser);

        LoginResponse loginResponse = new LoginResponse();
        loginResponse.setToken(jwtToken);
        loginResponse.setExpiresIn(jwtService.getExpirationTime());

        return ResponseEntity.ok(loginResponse);
    }
}