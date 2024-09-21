package com.kakolats.shop_app.utils.mapper;

import com.kakolats.shop_app.dto.ClientDTO;
import com.kakolats.shop_app.entity.Client;

public interface IClientMapper {
    Client ClientDtoToClient(ClientDTO client);
    ClientDTO clientToClientDto(Client client);
}
