import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  // This will space out the children
          crossAxisAlignment: CrossAxisAlignment.center,      // This will align children horizontally in the center
          children: <Widget>[
            const Expanded(
              child: Center(
                child: Text(
                  'Welcome to Our App!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),  // Add some padding around the button
              child: ElevatedButton(
                onPressed: () {
                  // Define the action for the button
                  controller.redirectToLogin();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue
                ),
                child: const Text('Get Started'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
