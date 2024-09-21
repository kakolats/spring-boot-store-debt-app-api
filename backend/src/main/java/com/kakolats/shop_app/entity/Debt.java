package com.kakolats.shop_app.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Debt implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime date = LocalDateTime.now();

    private Integer amount;
    private Boolean paid = Boolean.FALSE;

    @JsonIgnore
    @ManyToOne
    private Client client;

    @OneToMany(mappedBy = "debt", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<Payment> payments;

    public Integer calculateRemaining(){
        final Integer[] remaining = {this.getAmount()};
        if(!this.getPayments().isEmpty()){
            this.getPayments().forEach(payment -> {
                remaining[0] = remaining[0] - payment.getAmount();
            });
        }
        return remaining[0];
    }
}
