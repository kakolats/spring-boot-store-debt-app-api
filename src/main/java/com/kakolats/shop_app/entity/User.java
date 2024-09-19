package com.kakolats.shop_app.entity;

import com.kakolats.shop_app.enums.Role;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String email;

    private String login;

    private String password;

    @OneToOne
    private Image image;

    @OneToOne
    private Client client;

    @Enumerated(EnumType.STRING)
    private Role role;

    public User(String email,String login,String password){
        this.email = email;
        this.login = login;
        this.password = password;
    }

}
