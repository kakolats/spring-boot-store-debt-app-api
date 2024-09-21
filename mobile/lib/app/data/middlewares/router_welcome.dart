
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:show_debt_app/app/data/services/shared_preferences_service.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    final prefs = SharedPreferencesService();

    if (prefs.hasSeenWelcome == false) {
      return const RouteSettings(name: '/welcome');
    } else if (prefs.isLoggedIn == false) {
      return const RouteSettings(name: '/auth/login');
    } else if (prefs.isLoggedIn == true) {
      if (prefs.role == "BOUTIQUIER") {
        return const RouteSettings(name: '/boutiquier');
      } else {
        return const RouteSettings(name: '/client');
      }
    }
    return null;
  }
}
