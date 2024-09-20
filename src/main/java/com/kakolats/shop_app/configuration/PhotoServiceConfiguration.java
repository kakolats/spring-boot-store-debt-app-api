package com.kakolats.shop_app.configuration;

import com.kakolats.shop_app.service.IPhotoService;
import com.kakolats.shop_app.service.impl.PhotoServiceCloudinary;
import com.kakolats.shop_app.service.impl.PhotoServiceFirebase;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class PhotoServiceConfiguration {

    @Value("${photoservice.implementation}")
    private String photoService;



    private final PhotoServiceCloudinary photoServiceCloudinary;
    private final PhotoServiceFirebase photoServiceFirebase;

    @Autowired
    public PhotoServiceConfiguration(PhotoServiceCloudinary photoServiceCloudinary, PhotoServiceFirebase photoServiceFirebase) {
        this.photoServiceCloudinary = photoServiceCloudinary;
        this.photoServiceFirebase = photoServiceFirebase;
    }

    @Bean
    public IPhotoService photoService() {
        switch (photoService.toLowerCase()) {
            case "firebase":
                return photoServiceFirebase;
            case "cloudinary":
                return photoServiceCloudinary;
            default:
                throw new IllegalArgumentException("Service de photo inconnu : " + photoService);
        }
    }
}
