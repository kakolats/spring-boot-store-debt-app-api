package com.kakolats.shop_app.repository.impl;

import com.kakolats.shop_app.entity.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ClientRepository extends JpaRepository<Client,Long> {
    Optional<Client> findByTelephoneAndBoutiquierId(String telephone,Long id);
    List<Client> findByBoutiquierId(Long id);
    Optional<Client> findClientByUserId(Long userId);
}
