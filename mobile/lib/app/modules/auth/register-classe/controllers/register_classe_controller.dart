import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:show_debt_app/app/data/models/register_client_model.dart';
import 'package:show_debt_app/app/data/repositories/auth_repository.dart';

class RegisterClasseController extends GetxController {
  //TODO: Implement RegisterClasseController

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  final registerClasseFormKey = GlobalKey<FormState>();

  TextEditingController surnameController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<File?> selectedImage = Rx<File?>(null);


  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  void register() async{
    if (isLoading.value || registerClasseFormKey.currentState?.validate() != true){
      print('no go');
      return;
    }
    isLoading.value = true;
    print("It is in");
    if (selectedImage.value != null) {
      RegisterClientModel rm = new RegisterClientModel(surname: surnameController.text,telephone: telephoneController.text,adresse: adresseController.text,email: emailController.text, password: passwordController.text, login: loginController.text);
      var response = await AuthRepository().registerClient(rm, selectedImage.value!);
      isLoading(false);
      print("It is in deeper");
      if (response!=null) {
        Get.offAllNamed('/boutiquier');
      } else {
        // Set error message if login fails
        errorMessage("Une erreur interne est survenue, veuillez rééssayer");
      }
    }else{

    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
