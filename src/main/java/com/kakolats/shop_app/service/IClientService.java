package com.kakolats.shop_app.service;

import com.kakolats.shop_app.entity.Client;
import org.springframework.web.multipart.MultipartFile;

public interface IClientService {
    Client saveClient(Client client, MultipartFile file,IPhotoService photoService);
}
