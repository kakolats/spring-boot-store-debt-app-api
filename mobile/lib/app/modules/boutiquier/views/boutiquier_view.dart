import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:show_debt_app/utils/common_widgets/logout_button.dart';

import '../controllers/boutiquier_controller.dart';

class BoutiquierView extends GetView<BoutiquierController> {
  const BoutiquierView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BoutiquierView'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            LogoutButton()
          ],
        ),
      )
    );
  }
}
