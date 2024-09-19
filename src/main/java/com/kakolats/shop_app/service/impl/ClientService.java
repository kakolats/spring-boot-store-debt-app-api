package com.kakolats.shop_app.service.impl;

import com.kakolats.shop_app.entity.Client;
import com.kakolats.shop_app.entity.Image;
import com.kakolats.shop_app.repository.impl.ClientRepository;
import com.kakolats.shop_app.service.IClientService;
import com.kakolats.shop_app.service.IPhotoService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@RequiredArgsConstructor
public class ClientService implements IClientService {
    private final ClientRepository clientRepository;

    @Override
    public Client saveClient(Client client, MultipartFile file, IPhotoService photoService) {
        return null;
    }
}
