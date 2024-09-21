package com.kakolats.shop_app.utils.mapper;

import com.kakolats.shop_app.dto.DebtDTO;
import com.kakolats.shop_app.entity.Debt;

public interface IDebtMapper {
    Debt debtDtoToDebt(DebtDTO debtDTO);
    DebtDTO debtToDebtDto(Debt debt);
}
