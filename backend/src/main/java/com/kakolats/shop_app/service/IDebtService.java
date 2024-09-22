package com.kakolats.shop_app.service;

import com.kakolats.shop_app.dto.DebtDTO;
import com.kakolats.shop_app.entity.Debt;

import java.util.List;

public interface IDebtService {
    Debt createDebt(Long idClient,Debt debt);
    Debt updateDebt(Debt debt);
    List<DebtDTO> getAllUnpaidDebts(Long idClient);
    List<DebtDTO> getAllUnpaidDebtsByConnectedUser(Long idUser);
    Debt getOnebyId(Long id);
}
