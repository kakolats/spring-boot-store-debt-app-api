package com.kakolats.shop_app.configuration;

import com.kakolats.shop_app.service.IDebtService;
import com.kakolats.shop_app.service.impl.DebtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

public class DebtServiceConfiguration {
    private final DebtService debtService;

    @Autowired
    public DebtServiceConfiguration(DebtService debtService) {
        this.debtService = debtService;
    }

    @Bean
    public IDebtService debtService(){
        return debtService;
    }
}
