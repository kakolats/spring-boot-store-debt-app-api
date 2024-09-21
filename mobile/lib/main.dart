import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/data/services/shared_preferences_service.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
