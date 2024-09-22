import 'package:get/get.dart';
import 'package:show_debt_app/app/data/models/client_model.dart';
import 'package:show_debt_app/app/data/repositories/boutiquier_repository.dart';

class BoutiquierController extends GetxController {
  //TODO: Implement BoutiquierController
  final clients = <ClientModel>[].obs;
  final filteredClients = <ClientModel>[].obs;
  final showAccountHoldersOnly = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadClients();
  }

  void loadClients() async {
    try {
      List<ClientModel>? list = await BoutiquierRepository().getAllClients();
      if (list != null) {
        clients.assignAll(list);
        updateFilteredClients(); // Initialize the filtered list
      }
    } catch (e) {
      print('Error fetching clients: $e');
    }
  }



  void toggleAccountFilter(bool value) {
    showAccountHoldersOnly(value); // Update the toggle state
    updateFilteredClients(); // Update the filtered list based on the new state
  }

  void updateFilteredClients() {
    if (showAccountHoldersOnly.isTrue) {
      filteredClients.assignAll(clients.where((client) => client.hasAccount));
    } else {
      filteredClients.assignAll(clients);
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
