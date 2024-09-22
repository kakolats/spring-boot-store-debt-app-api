import 'package:get/get.dart';
import 'package:show_debt_app/app/data/models/debt_model.dart';
import 'package:show_debt_app/app/data/repositories/client_repository.dart';

class ClientController extends GetxController {
  //TODO: Implement ClientController
  final debts = <DebtModel>[].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadDebts();
  }

  void loadDebts() async {
    print("loadDebts");
    try {
      List<DebtModel>? list = await ClientRepository().getAllDebts();
      if (list != null) {
        debts.assignAll(list);
      }
    } catch (e) {
      print('Error fetching debts: $e');
      // Optionally, handle the error in a user-friendly way, e.g., showing an error message on the UI
    }
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
