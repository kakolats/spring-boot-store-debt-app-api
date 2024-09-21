package com.kakolats.shop_app.controller.impl;

import com.kakolats.shop_app.dto.ClientDTO;
import com.kakolats.shop_app.dto.ClientUserDTO;
import com.kakolats.shop_app.entity.Client;
import com.kakolats.shop_app.entity.User;
import com.kakolats.shop_app.service.IClientService;
import com.kakolats.shop_app.utils.mapper.IClientMapper;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Log4j2
@RestController
@RequestMapping("clients")
@RequiredArgsConstructor
public class ClientController {
    private final IClientService clientService;
    private final IClientMapper clientMapper;

    @PostMapping
    public ResponseEntity<Client> createClient(@RequestBody Client client){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();
        log.info("currentUser: {}",currentUser);
        return ResponseEntity.ok(clientService.createClient(client,currentUser));
    }

    @PostMapping(value = "/with-account", consumes = {"multipart/form-data"})
    public ResponseEntity<Client> createClientWithAccount(@RequestPart("client") ClientUserDTO userClient,  // Pour traiter les données JSON du client
                                                          @RequestPart("file") MultipartFile file){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();
        return ResponseEntity.ok(clientService.saveClientWithAccount(userClient,currentUser,file));
    }

    @GetMapping
    public ResponseEntity<List<ClientDTO>> getAllClients(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();
        List<Client> clients = clientService.getAllClients(currentUser.getId());
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
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();
        Client client = clientService.findByTelephone(telephone,currentUser.getId());
        return ResponseEntity.ok(clientMapper.clientToClientDto(client));
    }


}
