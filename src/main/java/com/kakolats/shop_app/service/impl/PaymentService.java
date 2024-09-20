package com.kakolats.shop_app.service.impl;

import com.kakolats.shop_app.entity.Debt;
import com.kakolats.shop_app.entity.Payment;
import com.kakolats.shop_app.repository.impl.DebtRepository;
import com.kakolats.shop_app.repository.impl.PaymentRepository;
import com.kakolats.shop_app.service.IDebtService;
import com.kakolats.shop_app.service.IPaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PaymentService implements IPaymentService {

    private final PaymentRepository paymentRepository;
    private final IDebtService debtService;

    @Override
    public Payment createPayment(Long debtId, Payment payment) {
        Debt debt = debtService.getOnebyId(debtId);
        payment.setDebt(debt);
        Payment payment1 = paymentRepository.save(payment);
        debt.setAmount(debt.getAmount()-payment1.getAmount());
        debtService.updateDebt(debt);
        return payment1;
    }

    @Override
    public List<Payment> getPaymentsByDebt(Long debtId) {
        return paymentRepository.findAllByDebtId(debtId);
    }
}
