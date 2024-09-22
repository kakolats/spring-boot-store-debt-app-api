package com.kakolats.shop_app.service.impl;

import com.kakolats.shop_app.dto.ClientUserDTO;
import com.kakolats.shop_app.dto.RegisterUserDto;
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
    private final AuthenticationService authenticationService;

    @Override
    public Client saveClient(Client client) {
        return clientRepository.save(client);
    }

    @Override
    public Client createClient(Client client, User boutiquier) {
        client.setBoutiquier(boutiquier);
        return clientRepository.save(client);
    }

    @Override
    public Client findByTelephone(String telephone,Long idBoutiquier) throws EntityNotFoundException {
        Optional<Client> client = clientRepository.findByTelephoneAndBoutiquierId(telephone,idBoutiquier);
        return client.orElseThrow(() -> new EntityNotFoundException("No Client found with phone number "+ telephone));
    }

    @Override
    public Client findByUser(Long userId) {
        Optional<Client> client = clientRepository.findClientByUserId(userId);
        return client.orElseThrow(() -> new EntityNotFoundException("Aucun client associé à l\'utilisateur connecté "));
    }

    @Override
    public Client saveClientWithAccount(ClientUserDTO clientUserDTO,User boutiquier,MultipartFile file) {
        Client client = new Client();
        client.setAdresse(clientUserDTO.getAdresse());
        client.setSurname(clientUserDTO.getSurname());
        client.setTelephone(clientUserDTO.getTelephone());
        client.setBoutiquier(boutiquier);
        if(!clientUserDTO.getEmail().isEmpty()&&!clientUserDTO.getLogin().isEmpty()&&!clientUserDTO.getPassword().isEmpty()){
           // User user = new User(clientUserDTO.getEmail(), clientUserDTO.getLogin(), clientUserDTO.getPassword());
            RegisterUserDto registerUserDto = new RegisterUserDto();
            registerUserDto.setEmail(clientUserDTO.getEmail());
            registerUserDto.setPassword(clientUserDTO.getPassword());
            registerUserDto.setLogin(clientUserDTO.getLogin());
            registerUserDto.setRole(Role.CLIENT);
            //user.setRole(Role.CLIENT);
            //User userSaved = userService.saveUser(user,file);
            User userSaved = authenticationService.signup(registerUserDto,file);
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
    public List<Client> getAllClients(Long idBoutiquier) {
        return clientRepository.findByBoutiquierId(idBoutiquier);
    }
}
