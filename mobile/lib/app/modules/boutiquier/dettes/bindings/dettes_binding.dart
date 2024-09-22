import 'package:get/get.dart';

import '../controllers/dettes_controller.dart';

class DettesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DettesController>(
      () => DettesController(),
    );
  }
}
