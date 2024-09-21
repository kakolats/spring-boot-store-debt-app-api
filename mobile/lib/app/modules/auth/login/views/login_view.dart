import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:show_debt_app/utils/common_widgets/gradient_background.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.loginController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (controller.loginFormKey.currentState?.validate() ?? false) {
                    controller.login();
                  }
                },
                child: Text('Connexion'),
              ),
            ],
          ),
        ),
      ),
    );*/
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const GradientBackground(
            children: [
              Text(
                "Connectez vous à votre compte",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 34,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 6),
              Text("Connectez vous",
                  style: TextStyle(
                color: Colors.grey,
                letterSpacing: 0.5,
              )),
            ],
          ),
          Form(
            key: controller.loginFormKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: controller.loginController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre email';
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
                        return 'Veuillez entrer votre mot de passe';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  FilledButton(
                    onPressed: () {
                      if (controller.loginFormKey.currentState?.validate() ?? false) {
                        controller.login();
                      }
                    },
                    child: Text('Connexion'),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Vous êtes boutiquier et n'avez pas de compte ?",
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 0.5,
                )
              ),
              const SizedBox(width: 4),
              TextButton(
                onPressed: () => {
                  controller.redirectToRegister()
                },
                child: const Text("Créer un compte"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
