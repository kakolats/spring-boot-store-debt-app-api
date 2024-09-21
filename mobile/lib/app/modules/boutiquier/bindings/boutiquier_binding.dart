import 'package:get/get.dart';

import '../controllers/boutiquier_controller.dart';

class BoutiquierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoutiquierController>(
      () => BoutiquierController(),
    );
  }
}
