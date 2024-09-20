package com.kakolats.shop_app.controller.impl;

import com.kakolats.shop_app.entity.Debt;
import com.kakolats.shop_app.service.IDebtService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("debts")
@RequiredArgsConstructor
public class DebtController {

    private final IDebtService debtService;

    @PostMapping("/{clientId}")
    public ResponseEntity<Debt> createDebt(@PathVariable Long clientId, @RequestBody Debt debt){
        return ResponseEntity.ok(debtService.createDebt(clientId,debt));
    }

    @GetMapping("/{clientId}")
    public ResponseEntity<List<Debt>> getAllByClient(@PathVariable Long clientId){
        return ResponseEntity.ok(debtService.getAllUnpaidDebts(clientId));
    }
}
