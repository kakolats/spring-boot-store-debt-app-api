import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:show_debt_app/app/modules/auth/controllers/auth_controller.dart';

class LogoutButton extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => authController.logout(),
      child: Text("Logout"),
    );
  }
}
