package com.kakolats.shop_app.utils.mapper.impl;

import com.kakolats.shop_app.dto.ClientDTO;
import com.kakolats.shop_app.entity.Client;
import com.kakolats.shop_app.utils.mapper.IClientMapper;

public class ClientMapper implements IClientMapper {
    @Override
    public Client ClientDtoToClient(ClientDTO client) {
        return null;
    }

    @Override
    public ClientDTO clientToClientDto(Client client) {
        if(client==null){
            return null;
        }
        ClientDTO clientDTO = new ClientDTO();
        clientDTO.setId(client.getId());
        clientDTO.setSurname(clientDTO.getSurname());
        clientDTO.setAdresse(clientDTO.getAdresse());
        clientDTO.setTelephone(clientDTO.getTelephone());
        clientDTO.setHasAccount(clientDTO.getHasAccount());
        Integer cumul = 0;
        if(client.getDebts().isEmpty()){
            clientDTO.setCumulDettes(cumul);
        }else{
            client.getDebts().forEach(debt -> {
                //cumul+=debt.
            });
        }

        return null;
    }
}
