import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_debt_app/app/data/models/register_client_model.dart';
import 'package:show_debt_app/app/data/models/register_model.dart';
import 'package:show_debt_app/app/modules/auth/providers/register_provider.dart';

import '../../modules/auth/providers/auth_provider.dart';
import '../models/login_response_model.dart';

class AuthRepository {
  final AuthProvider _authProvider = AuthProvider();
  final RegisterProvider _registerProvider = RegisterProvider();

  Future<LoginResponse?> login(String email, String password) async {
    final response = await _authProvider.login(email, password);
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(response.body);
    }
    return null;
  }

  Future<String?> register(RegisterModel registerModel,File file) async {
    final response = await _registerProvider.register(registerModel,file);
    if (response.statusCode == 200) {
      return response.statusMessage;
    }
    return null;
  }

  Future<String?> registerClient(RegisterClientModel registerModel,File file) async {
    final response = await _registerProvider.registerClient(registerModel,file);
    if (response.statusCode == 200) {
      return response.statusMessage;
    }
    return null;
  }

}