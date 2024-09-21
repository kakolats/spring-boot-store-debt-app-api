package com.kakolats.shop_app.repository.impl;

import com.kakolats.shop_app.entity.Payment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PaymentRepository extends JpaRepository<Payment,Long> {
    List<Payment> findAllByDebtId(Long debtId);
}
