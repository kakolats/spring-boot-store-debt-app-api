package com.kakolats.shop_app.controller.impl;

import com.kakolats.shop_app.entity.Client;
import com.kakolats.shop_app.entity.User;
import com.kakolats.shop_app.service.IClientService;
import com.kakolats.shop_app.service.IPhotoService;
import com.kakolats.shop_app.service.IUserService;
import com.kakolats.shop_app.service.impl.PhotoServiceCloudinary;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("users")
@AllArgsConstructor
public class UserController {

    private final IUserService userService;

    @PostMapping(value = "/client", consumes = {"multipart/form-data"})
    public ResponseEntity<User> createClientUser(@RequestPart("client") User user,  // Pour traiter les données JSON du client
                                                 @RequestPart("file") MultipartFile file){
                return ResponseEntity.ok(this.userService.saveUser(user,file));
    }

}
