import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_debt_app/app/data/repositories/auth_repository.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  final loginFormKey = GlobalKey<FormState>();

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final count = 0.obs;
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
    loginController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() async {
    if (!loginFormKey.currentState!.validate()) {
      return; // If validation fails, exit early
    }

    isLoading(true); // Set loading to true
    // Reset error message to null

    // Simulate a login attempt
    var response = await AuthRepository().login(loginController.text, passwordController.text);
    print(response);
    isLoading(false); // Set loading to false when the operation is complete

    if (response!=null) {
      errorMessage(null);
      saveToken(response.token,response.role);
      // Navigate to the next screen on successful login
      if(response.role=='BOUTIQUIER'){
        Get.offAllNamed('/boutiquier');
      }else if(response.role=='CLIENT'){
        Get.offAllNamed('/client');
      }

    } else {
      // Set error message if login fails
      errorMessage("Login ou mot de passe incorrect");
    }
  }

  void redirectToRegister(){
    Get.offAllNamed('/auth/register');
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



  //void increment() => count.value++;
}
