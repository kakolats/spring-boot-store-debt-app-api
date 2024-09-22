import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:show_debt_app/utils/common_widgets/logout_button.dart';
import 'package:show_debt_app/utils/profile_widgets/side_drawer_boutiquier.dart';

import '../controllers/boutiquier_controller.dart';

class BoutiquierView extends GetView<BoutiquierController> {
  const BoutiquierView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Clients"),
        centerTitle: true,
      ),
      drawer: SideDrawerBoutiquier(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    'Afficher uniquement les clients avec compte',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Obx(() => Switch(
                  value: controller.showAccountHoldersOnly.value,
                  onChanged: (value) {
                    controller.toggleAccountFilter(value);
                  },
                  activeColor: Colors.green,
                )),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.filteredClients.length,
              itemBuilder: (context, index) {
                final client = controller.filteredClients[index];
                return InkWell(
                  onTap: () {
                    // Define action when card is tapped
                    // For example, navigate to a client detail page or show a dialog
                    Get.toNamed('/boutiquier/dettes/${client.id}');
                  },
                  child: Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    shadowColor: Colors.black.withOpacity(0.5),
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
                            "${client.surname}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Téléphone: ${client.telephone}",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Adresse: ${client.adresse}",
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                client.hasAccount ? Icons.check_circle : Icons.remove_circle,
                                color: client.hasAccount ? Colors.green : Colors.red,
                              ),
                              SizedBox(width: 8),
                              Text(
                                client.hasAccount ? "Compte Actif" : "Pas de Compte",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: client.hasAccount ? Colors.green : Colors.red,
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
