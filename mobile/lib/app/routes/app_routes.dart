part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const AUTH = _Paths.AUTH;
  static const LOGIN = _Paths.AUTH + _Paths.LOGIN;
  static const BOUTIQUIER = _Paths.BOUTIQUIER;
  static const CLIENT = _Paths.CLIENT;
  static const REGISTER = _Paths.AUTH + _Paths.REGISTER;
  static const DETTES = _Paths.BOUTIQUIER + _Paths.DETTES;
  static const REGISTER_CLASSE = _Paths.AUTH + _Paths.REGISTER_CLASSE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const AUTH = '/auth';
  static const LOGIN = '/login';
  static const BOUTIQUIER = '/boutiquier';
  static const CLIENT = '/client';
  static const REGISTER = '/register';
  static const DETTES = '/dettes/:id';
  static const REGISTER_CLASSE = '/register-classe';
}
