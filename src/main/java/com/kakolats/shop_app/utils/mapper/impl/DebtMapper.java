package com.kakolats.shop_app.utils.mapper.impl;

import com.kakolats.shop_app.dto.DebtDTO;
import com.kakolats.shop_app.entity.Debt;
import com.kakolats.shop_app.utils.mapper.IDebtMapper;
import org.springframework.stereotype.Service;

@Service
public class DebtMapper implements IDebtMapper {
    @Override
    public Debt debtDtoToDebt(DebtDTO debtDTO) {
        return null;
    }

    @Override
    public DebtDTO debtToDebtDto(Debt debt) {
        if(debt==null){
            return null;
        }
        DebtDTO debtDTO = new DebtDTO();
        debtDTO.setId(debt.getId());
        debtDTO.setAmount(debt.getAmount());
        debtDTO.setDate(debt.getDate());
        debtDTO.setPaid(debt.getPaid());
        /*final Integer[] remaining = {debt.getAmount()};
        if(debt.getPayments().isEmpty()){
            debtDTO.setAmountRemaining(remaining[0]);
        }else{
            debt.getPayments().forEach(payment -> {
                remaining[0] = remaining[0] - payment.getAmount();
            });
            debtDTO.setAmountRemaining(remaining[0]);
        }*/
        debtDTO.setAmountRemaining(debt.calculateRemaining());
        return debtDTO;
    }
}
