package com.kakolats.shop_app.service;

import com.kakolats.shop_app.entity.Image;
import org.springframework.web.multipart.MultipartFile;

public interface IPhotoService {
    String saveImage(MultipartFile file);
}
