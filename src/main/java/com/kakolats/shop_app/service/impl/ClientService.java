package com.kakolats.shop_app.service.impl;

import com.kakolats.shop_app.dto.ClientUserDTO;
import com.kakolats.shop_app.entity.Client;
import com.kakolats.shop_app.entity.Image;
import com.kakolats.shop_app.entity.User;
import com.kakolats.shop_app.enums.Role;
import com.kakolats.shop_app.repository.impl.ClientRepository;
import com.kakolats.shop_app.service.IClientService;
import com.kakolats.shop_app.service.IPhotoService;
import com.kakolats.shop_app.service.IUserService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class ClientService implements IClientService {
    private final ClientRepository clientRepository;
    private final IUserService userService;

    @Override
    public Client saveClient(Client client) {
        return clientRepository.save(client);
    }

    @Override
    public Client findByTelephone(String telephone) throws EntityNotFoundException {
        Optional<Client> client = clientRepository.findByTelephone(telephone);
        return client.orElseThrow(() -> new EntityNotFoundException("No Client found with phone number "+ telephone));
    }

    @Override
    public Client saveClientWithAccount(ClientUserDTO clientUserDTO,MultipartFile file) {
        Client client = new Client();
        client.setAdresse(clientUserDTO.getAdresse());
        client.setSurname(clientUserDTO.getSurname());
        client.setTelephone(clientUserDTO.getTelephone());
        if(!clientUserDTO.getEmail().isEmpty()&&!clientUserDTO.getLogin().isEmpty()&&!clientUserDTO.getPassword().isEmpty()){
            User user = new User(clientUserDTO.getEmail(), clientUserDTO.getLogin(), clientUserDTO.getPassword());
            user.setRole(Role.CLIENT);
            User userSaved = userService.saveUser(user,file);
            if(userSaved!=null){
                client.setUser(userSaved);
                client.setHasAccount(true);
            }
        }
        return clientRepository.save(client);
    }

    @Override
    public Client findById(Long id) {
        return clientRepository.findById(id).get();
    }

    @Override
    public List<Client> getAllClients() {
        return clientRepository.findAll();
    }
}
