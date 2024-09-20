package com.kakolats.shop_app.service.impl;

import com.kakolats.shop_app.entity.Client;
import com.kakolats.shop_app.entity.Debt;
import com.kakolats.shop_app.repository.impl.DebtRepository;
import com.kakolats.shop_app.service.IClientService;
import com.kakolats.shop_app.service.IDebtService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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
        return debtRepository.findDebtsByClientIdAndPaidIsFalse(idClient);
    }

    @Override
    public Debt getOnebyId(Long id) throws EntityNotFoundException {
        Optional<Debt> debt = debtRepository.findById(id);
        return debt.orElseThrow(() -> new EntityNotFoundException("Aucune dette n\'a été trouvée avec l\'id: "+ id));
    }
}
