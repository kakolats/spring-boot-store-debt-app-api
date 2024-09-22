import 'package:get/get.dart';

import '../controllers/register_classe_controller.dart';

class RegisterClasseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterClasseController>(
      () => RegisterClasseController(),
    );
  }
}
