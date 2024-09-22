package com.kakolats.shop_app.service.impl;

import com.kakolats.shop_app.dto.DebtDTO;
import com.kakolats.shop_app.entity.Client;
import com.kakolats.shop_app.entity.Debt;
import com.kakolats.shop_app.repository.impl.DebtRepository;
import com.kakolats.shop_app.service.IClientService;
import com.kakolats.shop_app.service.IDebtService;
import com.kakolats.shop_app.utils.mapper.IDebtMapper;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DebtService implements IDebtService {

    private final DebtRepository debtRepository;
    private final IClientService clientService;
    private final IDebtMapper debtMapper;

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
    public List<DebtDTO> getAllUnpaidDebts(Long idClient) {
        List<Debt> debts = debtRepository.findDebtsByClientIdAndPaidIsFalse(idClient);
        List<DebtDTO> debtDTOS = new ArrayList<>();
        if(!debts.isEmpty()){
            debts.forEach(debt -> {
                debtDTOS.add(debtMapper.debtToDebtDto(debt));
            });
        }
        return debtDTOS;
    }

    @Override
    public List<DebtDTO> getAllUnpaidDebtsByConnectedUser(Long idUser) {
        Client client = clientService.findByUser(idUser);
        List<Debt> debts = debtRepository.findDebtsByClientIdAndPaidIsFalse(client.getId());
        List<DebtDTO> debtDTOS = new ArrayList<>();
        if(!debts.isEmpty()){
            debts.forEach(debt -> {
                debtDTOS.add(debtMapper.debtToDebtDto(debt));
            });
        }
        return debtDTOS;
    }

    @Override
    public Debt getOnebyId(Long id) throws EntityNotFoundException {
        Optional<Debt> debt = debtRepository.findById(id);
        return debt.orElseThrow(() -> new EntityNotFoundException("Aucune dette n\'a été trouvée avec l\'id: "+ id));
    }
}
