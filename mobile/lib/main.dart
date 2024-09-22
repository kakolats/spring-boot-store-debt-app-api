import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:show_debt_app/app/data/services/auth_interceptor.dart';

import 'app/data/services/shared_preferences_service.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();
  Get.put(AuthInterceptor());
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
