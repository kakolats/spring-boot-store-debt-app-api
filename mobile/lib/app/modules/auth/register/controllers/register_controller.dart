import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_debt_app/app/data/models/register_model.dart';
import 'package:show_debt_app/app/data/repositories/auth_repository.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  final registerFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<File?> selectedImage = Rx<File?>(null);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  void register() async{
    if (isLoading.value || registerFormKey.currentState?.validate() != true){
      print('no go');
      return;
    }
    isLoading.value = true;
    print("It is in");
    if (selectedImage.value != null) {
      RegisterModel rm = new RegisterModel(email: emailController.text, password: passwordController.text, login: loginController.text);
      var response = await AuthRepository().register(rm, selectedImage.value!);
      isLoading(false);
      print("It is in deeper");
      if (response!=null) {
        /*errorMessage(null);
        saveToken(response.token,response.role);
        // Navigate to the next screen on successful login
        if(response.role=='BOUTIQUIER'){
          Get.offAllNamed('/boutiquier');
        }else if(response.role=='CLIENT'){
          Get.offAllNamed('/client');
        }*/
        //print(response);
        Get.offAllNamed('/auth/login');
      } else {
        // Set error message if login fails
        errorMessage("Une erreur interne est survenue, veuillez rééssayer");
      }
    }else{

    }
  }

  Future<void> saveToken(String token,String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userToken', token);
    await prefs.setString('role', role);
    await prefs.setBool('isLoggedIn', true);
    // Implementation to save token, e.g., using SharedPreferences
  }

  // Clear token
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken');
    await prefs.remove('role');
    await prefs.remove('isLoggedIn');
  }

  void redirectToSignin(){
    Get.offAllNamed('/auth/login');
  }

  @override
  void onClose() {
    emailController.dispose();
    loginController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  //void increment() => count.value++;
}
