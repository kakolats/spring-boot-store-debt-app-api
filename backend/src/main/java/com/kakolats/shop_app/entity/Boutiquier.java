package com.kakolats.shop_app.entity;

import com.kakolats.shop_app.enums.Role;

public class Boutiquier extends User{

    public Boutiquier(String email, String login, String password, String surname, String telephone, String adresse) {
        super(email, login, password);  // Calling the superclass constructor to initialize inherited fields
        this.setRole(Role.BOUTIQUIER);
    }
}
