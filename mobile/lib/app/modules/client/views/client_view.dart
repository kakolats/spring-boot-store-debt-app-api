import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:show_debt_app/utils/profile_widgets/side_drawer_client.dart';
import '../controllers/client_controller.dart';

class ClientView extends GetView<ClientController> {
  const ClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste de vos dettes"),
        centerTitle: true,
      ),
      drawer: SideDrawerClient(),
      body: Obx(() => ListView.builder(
        itemCount: controller.debts.length,
        itemBuilder: (context, index) {
          final debt = controller.debts[index];
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
          );
        },
      )),
    );
  }
}
