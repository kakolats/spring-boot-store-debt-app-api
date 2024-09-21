package com.kakolats.shop_app.service.impl;

import com.kakolats.shop_app.entity.Image;
import com.kakolats.shop_app.entity.User;
import com.kakolats.shop_app.repository.impl.ImageRepository;
import com.kakolats.shop_app.repository.impl.UserRepository;
import com.kakolats.shop_app.service.IPhotoService;
import com.kakolats.shop_app.service.IUserService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService implements IUserService {

    private final UserRepository userRepository;
    private final ImageRepository imageRepository;
    private final IPhotoService photoService;
    @Override
    public User saveUser(User user, MultipartFile file) {
        String imageLink = photoService.saveImage(file);
        Image image = new Image();
        image.setLink(imageLink);
        Image imageSaved = imageRepository.save(image);
        user.setImage(imageSaved);
        return userRepository.save(user);
    }

    public List<User> allUsers() {
        List<User> users = new ArrayList<>();
        userRepository.findAll().forEach(users::add);
        return users;
    }
}
