package com.kakolats.shop_app.service;

import com.kakolats.shop_app.entity.User;
import org.springframework.web.multipart.MultipartFile;

public interface IUserService {
    User saveUser(User user, MultipartFile file);
}
