package com.kakolats.shop_app.controller.impl;

import com.kakolats.shop_app.dto.ClientUserDTO;
import com.kakolats.shop_app.entity.Client;
import com.kakolats.shop_app.entity.User;
import com.kakolats.shop_app.service.IClientService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("clients")
@RequiredArgsConstructor
public class ClientController {
    private final IClientService clientService;

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
    public ResponseEntity<List<Client>> getAllClients(){
        return ResponseEntity.ok(clientService.getAllClients());
    }


}
