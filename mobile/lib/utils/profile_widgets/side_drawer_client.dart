import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:show_debt_app/app/modules/auth/controllers/auth_controller.dart';

class SideDrawerClient extends StatelessWidget{
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context){
    return  Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu client'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Deconnexion'),
            onTap: () {
              authController.logout();
            },
          )
        ],
      ),
    );
  }
}