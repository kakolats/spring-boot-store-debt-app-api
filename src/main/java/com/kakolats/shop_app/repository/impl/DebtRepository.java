package com.kakolats.shop_app.repository.impl;

import com.kakolats.shop_app.entity.Debt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DebtRepository extends JpaRepository<Debt, Long> {
    List<Debt> findDebtsByClientIdAndPaidIsFalse(Long clientId);
}
