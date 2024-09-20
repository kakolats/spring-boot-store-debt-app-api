package com.kakolats.shop_app.service;

import com.kakolats.shop_app.dto.ClientUserDTO;
import com.kakolats.shop_app.entity.Client;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface IClientService {
    Client saveClient(Client client);
    Client saveClientWithAccount(ClientUserDTO clientUserDTO,MultipartFile file);
    Client findById(Long id);
    List<Client> getAllClients();
}
