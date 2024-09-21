import 'package:get/get.dart';

import '../data/middlewares/router_welcome.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/boutiquier/bindings/boutiquier_binding.dart';
import '../modules/boutiquier/views/boutiquier_view.dart';
import '../modules/client/bindings/client_binding.dart';
import '../modules/client/views/client_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        middlewares: [RouteWelcomeMiddleware()]),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
      children: [
        GetPage(
          name: _Paths.LOGIN,
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: _Paths.REGISTER,
          page: () => const RegisterView(),
          binding: RegisterBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.BOUTIQUIER,
      page: () => const BoutiquierView(),
      binding: BoutiquierBinding(),
    ),
    GetPage(
      name: _Paths.CLIENT,
      page: () => const ClientView(),
      binding: ClientBinding(),
    ),
  ];
}
