package com.kakolats.shop_app.service.impl;

import com.kakolats.shop_app.entity.Client;
import com.kakolats.shop_app.entity.Debt;
import com.kakolats.shop_app.repository.impl.DebtRepository;
import com.kakolats.shop_app.service.IClientService;
import com.kakolats.shop_app.service.IDebtService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DebtService implements IDebtService {

    private final DebtRepository debtRepository;
    private final IClientService clientService;

    @Override
    public Debt createDebt(Long idClient, Debt debt) {
        Client cl = clientService.findById(idClient);
        debt.setClient(cl);
        Debt debtSaved = debtRepository.save(debt);
        clientService.saveClient(cl);
        return debtSaved;
    }

    @Override
    public Debt updateDebt(Debt debt) {
        return debtRepository.save(debt);
    }

    @Override
    public List<Debt> getAllUnpaidDebts(Long idClient) {
        return debtRepository.findDebtsByClientId(idClient);
    }

    @Override
    public Debt getOnebyId(Long id) {
        return debtRepository.findById(id).get();
    }
}
