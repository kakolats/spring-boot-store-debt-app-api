package com.kakolats.shop_app.controller.impl;

import com.kakolats.shop_app.dto.ClientDTO;
import com.kakolats.shop_app.dto.ClientUserDTO;
import com.kakolats.shop_app.entity.Client;
import com.kakolats.shop_app.entity.User;
import com.kakolats.shop_app.service.IClientService;
import com.kakolats.shop_app.utils.mapper.IClientMapper;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("clients")
@RequiredArgsConstructor
public class ClientController {
    private final IClientService clientService;
    private final IClientMapper clientMapper;

    @PostMapping
    public ResponseEntity<Client> createClient(@RequestBody Client client){
        return ResponseEntity.ok(clientService.saveClient(client));
    }

    @PostMapping(value = "/with-account", consumes = {"multipart/form-data"})
    public ResponseEntity<Client> createClientWithAccount(@RequestPart("client") ClientUserDTO userClient,  // Pour traiter les données JSON du client
                                                          @RequestPart("file") MultipartFile file){
        return ResponseEntity.ok(clientService.saveClientWithAccount(userClient,file));
    }

    @GetMapping
    public ResponseEntity<List<ClientDTO>> getAllClients(){
        List<Client> clients = clientService.getAllClients();
        List<ClientDTO> clientDTOS = new ArrayList<ClientDTO>();
        if(!clients.isEmpty()){
            clients.forEach(client -> {
                clientDTOS.add(clientMapper.clientToClientDto(client));
            });
        }
        return ResponseEntity.ok(clientDTOS);
    }

    @GetMapping("/telephone/{telephone}")
    public ResponseEntity<ClientDTO> getClientByTelephone(@PathVariable String telephone) throws EntityNotFoundException {
        Client client = clientService.findByTelephone(telephone);
        return ResponseEntity.ok(clientMapper.clientToClientDto(client));
    }


}
