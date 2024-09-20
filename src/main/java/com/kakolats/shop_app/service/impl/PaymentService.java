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
    public Payment createPayment(Long debtId, Payment payment) throws EntityNotFoundException,IllegalArgumentException {
        Debt debt = debtService.getOnebyId(debtId);
        if(debt.calculateRemaining()<payment.getAmount()){
            throw new IllegalArgumentException("Le montant du paiement est trop élévé");
        }
        payment.setDebt(debt);
        Payment payment1 = paymentRepository.save(payment);
        if(debt.calculateRemaining()-payment1.getAmount()==0){
            debt.setPaid(Boolean.TRUE);
            debtService.updateDebt(debt);
        }
        return payment1;
    }

    @Override
    public List<Payment> getPaymentsByDebt(Long debtId) {
        return paymentRepository.findAllByDebtId(debtId);
    }
}
