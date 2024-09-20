package com.kakolats.shop_app.service.impl;

import com.kakolats.shop_app.entity.Debt;
import com.kakolats.shop_app.entity.Payment;
import com.kakolats.shop_app.repository.impl.DebtRepository;
import com.kakolats.shop_app.repository.impl.PaymentRepository;
import com.kakolats.shop_app.service.IDebtService;
import com.kakolats.shop_app.service.IPaymentService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PaymentService implements IPaymentService {

    private final PaymentRepository paymentRepository;
    private final IDebtService debtService;

    @Override
    public Payment createPayment(Long debtId, Payment payment) throws EntityNotFoundException {
        Debt debt = debtService.getOnebyId(debtId);
        payment.setDebt(debt);
        return paymentRepository.save(payment);
    }

    @Override
    public List<Payment> getPaymentsByDebt(Long debtId) {
        return paymentRepository.findAllByDebtId(debtId);
    }
}
