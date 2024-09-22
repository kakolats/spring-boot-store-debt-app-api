import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:show_debt_app/utils/common_widgets/gradient_background.dart';
import 'package:show_debt_app/utils/profile_widgets/side_drawer_boutiquier.dart';

import '../controllers/register_classe_controller.dart';

class RegisterClasseView extends GetView<RegisterClasseController> {
  const RegisterClasseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Création de client"),
        centerTitle: true,
      ),
      drawer: SideDrawerBoutiquier(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const GradientBackground(
            children: [
              Text(
                "Créer un client et un compte",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 34,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 6),
              Text("Créer un compte",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 0.5,
                  )),
            ],
          ),
          Form(
            key: controller.registerClasseFormKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: controller.surnameController,
                      decoration: InputDecoration(labelText: 'Nom complet'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer le nom complet';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: controller.telephoneController,
                      decoration: InputDecoration(labelText: 'Telephone'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer le telephone';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: controller.adresseController,
                      decoration: InputDecoration(labelText: 'Adresse'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer l\'adresse';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer l\'adresse email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: controller.loginController,
                      decoration: InputDecoration(labelText: 'Login'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer le login';
                        }
                        return null;
                      },
                    ),
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(labelText: 'Mot de passe'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer le mot de passe';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.pickImage,
                    child: Text('Pick Image'),
                  ),

                  Obx(() => controller.selectedImage.value != null
                      ? Image.file(
                    controller.selectedImage.value!,
                    height: 150,
                    fit: BoxFit.cover,
                  )
                      : Container()),
                  FilledButton(
                    onPressed: () {
                      if (controller.registerClasseFormKey.currentState?.validate() ?? false) {
                        controller.register();
                      }
                    },
                    child: Text('Créer le client'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
