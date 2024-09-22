import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:show_debt_app/utils/profile_widgets/side_drawer_boutiquier.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des dettes"),
        centerTitle: true,
      ),
      drawer: SideDrawerBoutiquier(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              // Assuming you have a GlobalKey<FormState>
              key: controller.createPaymentFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min, // Use minimum space for the form
                children: [
                  TextFormField(
                    controller: controller.amountController,
                    decoration: InputDecoration(labelText: 'Montant du paiement'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer le montant du paiement';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.createPaymentFormKey.currentState?.validate() ?? false) {
                        // Logic to handle form submission
                        controller.addPayment();
                      }
                    },
                    child: Text('Ajouter payment'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.payments.length,
              itemBuilder: (context, index) {
                final debt = controller.payments[index];
                String formattedDate = DateFormat('dd MMMM yyyy').format(debt.date);

                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(0.5),
                  borderOnForeground: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dette du: $formattedDate",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Montant : ${debt.amount}",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
