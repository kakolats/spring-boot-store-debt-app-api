import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void redirectToLogin(){
    Get.offAllNamed('/auth/login');
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
