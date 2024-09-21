package com.kakolats.shop_app.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DebtDTO {
    private Long id;
    private LocalDateTime date;
    private Integer amount;
    private Boolean paid;
    private Integer amountRemaining;
}
