package com.kakolats.shop_app.service;

import com.kakolats.shop_app.entity.User;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface IUserService {
    User saveUser(User user, MultipartFile file);

    List<User> allUsers();
}
