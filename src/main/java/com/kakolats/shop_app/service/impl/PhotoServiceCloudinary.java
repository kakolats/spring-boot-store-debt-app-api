package com.kakolats.shop_app.service.impl;


import com.cloudinary.Cloudinary;
import com.kakolats.shop_app.entity.Image;
import com.kakolats.shop_app.repository.impl.ImageRepository;
import com.kakolats.shop_app.service.IPhotoService;
import jakarta.annotation.Resource;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PhotoServiceCloudinary implements IPhotoService {

    private final Cloudinary cloudinary;

    @Override
    public String saveImage(MultipartFile file) {
        try{
            HashMap<Object, Object> options = new HashMap<>();
            options.put("folder", "clients");
            Map uploadedFile = cloudinary.uploader().upload(file.getBytes(), options);
            String publicId = (String) uploadedFile.get("public_id");
            String link = cloudinary.url().secure(true).generate(publicId);
            return link;
        }catch (IOException e){
            e.printStackTrace();
            return null;
        }
    }
}
