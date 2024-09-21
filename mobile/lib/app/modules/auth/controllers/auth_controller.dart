import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken');
    await prefs.remove('role');
    await prefs.remove('isLoggedIn');
  }

  void logout(){
    clearToken();
    Get.offAllNamed('/auth/login');
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
