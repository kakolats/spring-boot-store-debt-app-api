package com.kakolats.shop_app.service;

import com.kakolats.shop_app.entity.Payment;

import java.util.List;

public interface IPaymentService {
    Payment createPayment(Long debtId,Payment payment);
    List<Payment> getPaymentsByDebt(Long debtId);
}
