package com.kakolats.shop_app.service.impl;

import com.cloudinary.Cloudinary;
import com.kakolats.shop_app.service.IPhotoService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor
public class PhotoServiceFirebase implements IPhotoService {

    private final Cloudinary cloudinary;
    @Override
    public String saveImage(MultipartFile file) {
        return null;
    }
}
