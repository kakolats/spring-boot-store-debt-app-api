package com.kakolats.shop_app.controller.impl;

import com.kakolats.shop_app.dto.DebtDTO;
import com.kakolats.shop_app.entity.Debt;
import com.kakolats.shop_app.service.IDebtService;
import com.kakolats.shop_app.utils.mapper.IDebtMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("debts")
@RequiredArgsConstructor
public class DebtController {

    private final IDebtService debtService;
    private final IDebtMapper debtMapper;

    @PostMapping("/{clientId}")
    public ResponseEntity<Debt> createDebt(@PathVariable Long clientId, @RequestBody Debt debt){
        return ResponseEntity.ok(debtService.createDebt(clientId,debt));
    }

    @GetMapping("/{clientId}")
    public ResponseEntity<List<DebtDTO>> getAllByClient(@PathVariable Long clientId){
        List<Debt> debts = debtService.getAllUnpaidDebts(clientId);
        List<DebtDTO> debtDTOS = new ArrayList<>();
        if(!debts.isEmpty()){
            debts.forEach(debt -> {
                debtDTOS.add(debtMapper.debtToDebtDto(debt));
            });
        }
        return ResponseEntity.ok(debtDTOS);
    }
}
