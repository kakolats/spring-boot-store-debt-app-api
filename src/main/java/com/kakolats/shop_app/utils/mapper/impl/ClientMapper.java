package com.kakolats.shop_app.utils.mapper.impl;

import com.kakolats.shop_app.dto.ClientDTO;
import com.kakolats.shop_app.dto.DebtDTO;
import com.kakolats.shop_app.entity.Client;
import com.kakolats.shop_app.utils.mapper.IClientMapper;
import com.kakolats.shop_app.utils.mapper.IDebtMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class ClientMapper implements IClientMapper {

    private final IDebtMapper debtMapper;
    @Override
    public Client ClientDtoToClient(ClientDTO client) {
        return null;
    }

    @Override
    public ClientDTO clientToClientDto(Client client) {
        if(client==null){
            return null;
        }
        log.info("Client :{}",client);
        ClientDTO clientDTO = new ClientDTO();
        clientDTO.setId(client.getId());
        clientDTO.setSurname(client.getSurname());
        clientDTO.setAdresse(client.getAdresse());
        clientDTO.setTelephone(client.getTelephone());
        clientDTO.setHasAccount(client.getHasAccount());
        Integer[] cumul = {0};
        if(client.getUnpaidDebts().isEmpty()){
            clientDTO.setCumulDettes(cumul[0]);
        }else{
            client.getUnpaidDebts().forEach(debt -> {
                DebtDTO debtDTO = debtMapper.debtToDebtDto(debt);
                cumul[0] +=debtDTO.getAmountRemaining();
            });
            clientDTO.setCumulDettes(cumul[0]);
        }

        return clientDTO;
    }
}
