package com.kakolats.shop_app.controller.impl;

import com.kakolats.shop_app.entity.Payment;
import com.kakolats.shop_app.service.IPaymentService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("payments")
@RequiredArgsConstructor
public class PaymentController {
    private final IPaymentService paymentService;

    @PostMapping("/{debtId}")
    public ResponseEntity<Payment> createPayment(@PathVariable Long debtId, @RequestBody Payment payment) throws EntityNotFoundException,IllegalArgumentException {
        Payment payment1 = paymentService.createPayment(debtId,payment);
        return ResponseEntity.ok(payment1);
    }

    @GetMapping("/{debtId}")
    public ResponseEntity<List<Payment>> getPaymentsByDebt(@PathVariable Long debtId){
        List<Payment> payments = paymentService.getPaymentsByDebt(debtId);
        return ResponseEntity.ok(payments);
    }

}
