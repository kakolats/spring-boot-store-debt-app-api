package com.kakolats.shop_app.service.impl;

import com.kakolats.shop_app.dto.LoginUserDto;
import com.kakolats.shop_app.dto.RegisterUserDto;
import com.kakolats.shop_app.entity.Image;
import com.kakolats.shop_app.entity.User;
import com.kakolats.shop_app.repository.impl.ImageRepository;
import com.kakolats.shop_app.repository.impl.UserRepository;
import com.kakolats.shop_app.service.IAuthenticationService;
import com.kakolats.shop_app.service.IPhotoService;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AuthenticationService implements IAuthenticationService {
    private final UserRepository userRepository;

    private final PasswordEncoder passwordEncoder;

    private final AuthenticationManager authenticationManager;
    private final ImageRepository imageRepository;
    private final IPhotoService photoService;

    public AuthenticationService(
            UserRepository userRepository,
            AuthenticationManager authenticationManager,
            PasswordEncoder passwordEncoder,
            ImageRepository imageRepository,
            IPhotoService photoService
    ) {
        this.authenticationManager = authenticationManager;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.imageRepository = imageRepository;
        this.photoService = photoService;
    }

    @Override
    public User signup(RegisterUserDto input, MultipartFile file) {
        User user = new User();
        user.setEmail(input.getEmail());
        user.setLogin(input.getLogin());
        //user.setRole(input.getRole());
        user.setPassword(passwordEncoder.encode(input.getPassword()));
        String imageLink = photoService.saveImage(file);
        Image image = new Image();
        image.setLink(imageLink);
        Image imageSaved = imageRepository.save(image);
        user.setImage(imageSaved);
        return userRepository.save(user);
    }

    @Override
    public User authenticate(LoginUserDto input) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        input.getLogin(),
                        input.getPassword()
                )
        );

        return userRepository.findByLogin(input.getLogin())
                .orElseThrow();
    }
}