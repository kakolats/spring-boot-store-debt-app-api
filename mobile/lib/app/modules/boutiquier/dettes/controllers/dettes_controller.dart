import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:show_debt_app/app/data/models/client_model.dart';
import 'package:show_debt_app/app/data/models/debt_model.dart';

import '../../../../data/repositories/boutiquier_repository.dart';

class DettesController extends GetxController {
  //TODO: Implement DettesController
  late final String id;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  final debts = <DebtModel>[].obs;
  final count = 0.obs;
  final createDebtFormKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    id = Get.parameters['id'] ?? '0';
    loadDebts(id);
  }

  void loadDebts(String id) async {
    try {
      List<DebtModel>? list = await BoutiquierRepository().getClientDebts(id);
      if (list != null) {
        debts.assignAll(list);
      }
    } catch (e) {
      print('Error fetching clients: $e');
    }
  }

  void addDebt(){
    if (isLoading.value || createDebtFormKey.currentState?.validate() != true){
      print('no go');
      return;
    }
    isLoading.value = true;
    var response = BoutiquierRepository().createDebt(id, amountController.text);
    if(response!=null){
      loadDebts(id);
    }else{
      return;
    }
    isLoading(false);

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
