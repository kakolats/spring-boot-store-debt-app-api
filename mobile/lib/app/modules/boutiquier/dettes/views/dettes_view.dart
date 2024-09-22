import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:show_debt_app/utils/profile_widgets/side_drawer_boutiquier.dart';

import '../controllers/dettes_controller.dart';

class DettesView extends GetView<DettesController> {
  const DettesView({super.key});

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
              key: controller.createDebtFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min, // Use minimum space for the form
                children: [
                  TextFormField(
                    controller: controller.amountController,
                    decoration: InputDecoration(labelText: 'Montant de la dette'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer le montant de la dette';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.createDebtFormKey.currentState?.validate() ?? false) {
                        // Logic to handle form submission
                        controller.addDebt();
                      }
                    },
                    child: Text('Ajouter dette'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.debts.length,
              itemBuilder: (context, index) {
                final debt = controller.debts[index];
                String formattedDate = DateFormat('dd MMMM yyyy').format(debt.date);

                return InkWell(
                  onTap: () {
                    // Define action when card is tapped
                    // For example, navigate to a client detail page or show a dialog
                    Get.toNamed('/boutiquier/payment/${debt.id}');
                  },
                  child: Card(
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
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Montant initial: ${debt.amount}",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Montant restant à rembourser: ${debt.amountRemaining}",
                            style: TextStyle(fontSize: 16, color: Colors.redAccent),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                debt.paid ? "Complètement payé" : "Impayé",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: debt.paid ? Colors.green : Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
