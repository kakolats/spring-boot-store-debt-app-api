package com.kakolats.shop_app.controller.impl;

import com.kakolats.shop_app.dto.DebtDTO;
import com.kakolats.shop_app.entity.Debt;
import com.kakolats.shop_app.entity.User;
import com.kakolats.shop_app.service.IDebtService;
import com.kakolats.shop_app.utils.mapper.IDebtMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@Log4j2
@RequestMapping("debts")
@RequiredArgsConstructor
public class DebtController {

    private final IDebtService debtService;
    private final IDebtMapper debtMapper;

    @GetMapping("/me")
    public ResponseEntity<List<DebtDTO>> getAllByClientUser(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = (User) authentication.getPrincipal();
        log.info("Current User debts : {}",currentUser);
        List<Debt> debts = debtService.getAllUnpaidDebtsByConnectedUser(currentUser.getId());
        List<DebtDTO> debtDTOS = new ArrayList<>();
        if(!debts.isEmpty()){
            debts.forEach(debt -> {
                debtDTOS.add(debtMapper.debtToDebtDto(debt));
            });
        }
        return ResponseEntity.ok(debtDTOS);
    }

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
