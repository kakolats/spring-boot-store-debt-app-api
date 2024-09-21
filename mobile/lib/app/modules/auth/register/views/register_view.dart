import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../utils/common_widgets/gradient_background.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const GradientBackground(
            children: [
              Text(
                "Créer un compte boutiquier",
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
            key: controller.registerFormKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre email';
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
                          return 'Veuillez entrer votre login';
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
                      if (controller.registerFormKey.currentState?.validate() ?? false) {
                        controller.register();
                      }
                    },
                    child: Text('Créer un compte'),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  "Vous n'êtes pas boutiquier ou avez déjà un compte ?",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 0.5,
                  )
              ),
              const SizedBox(width: 4),
              TextButton(
                onPressed: () => {
                  controller.redirectToSignin()
                },
                child: const Text("Se connecter"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
