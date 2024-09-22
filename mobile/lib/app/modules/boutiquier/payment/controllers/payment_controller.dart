import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:show_debt_app/app/data/models/payment_model.dart';
import 'package:show_debt_app/app/data/repositories/boutiquier_repository.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController
  late final String id;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  final payments = <PaymentModel>[].obs;
  final count = 0.obs;
  final createPaymentFormKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    id = Get.parameters['id'] ?? '0';
    loadPayments(id);
  }

  void loadPayments(String id) async {
    try {
      List<PaymentModel>? list = await BoutiquierRepository().getDebtPayments(id);
      if (list != null) {
        payments.assignAll(list);
      }
    } catch (e) {
      print('Error fetching payments: $e');
    }
  }

  void addPayment(){
    if (isLoading.value || createPaymentFormKey.currentState?.validate() != true){
      print('no go');
      return;
    }
    isLoading.value = true;
    var response = BoutiquierRepository().createPayment(id, amountController.text);
    if(response!=null){
      loadPayments(id);
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
