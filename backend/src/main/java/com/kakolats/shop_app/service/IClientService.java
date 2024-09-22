package com.kakolats.shop_app.service;

import com.kakolats.shop_app.dto.ClientUserDTO;
import com.kakolats.shop_app.entity.Client;
import com.kakolats.shop_app.entity.User;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface IClientService {
    Client saveClient(Client client);
    Client createClient(Client client, User boutiquier);
    Client findByTelephone(String telephone,Long idBoutiquier);
    Client findByUser(Long userId);
    Client saveClientWithAccount(ClientUserDTO clientUserDTO,User boutiquier,MultipartFile file);
    Client findById(Long id);
    List<Client> getAllClients(Long idBoutiquier);
}
