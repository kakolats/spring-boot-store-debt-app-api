import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_debt_app/app/data/models/register_client_model.dart';

import '../../../data/models/register_model.dart';

class RegisterProvider{
  Future<Response> register(RegisterModel registerModel,File file) async{
    final dio = Dio();

    final formData = FormData.fromMap({
      'user': MultipartFile.fromString(
        jsonEncode({
          "email" : registerModel.email,
          "login" : registerModel.login,
          "password" : registerModel.password
        }),
        contentType:MediaType('application', 'json'), // Utilisation de Headers.jsonContentType pour le JSON
      ),
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
        contentType: MediaType('image', file.path.split('.').last), // Remplace MediaType par une chaîne de caractères
      ),
    });

    final response = await dio.post(
      'http://10.0.2.2:8080/auth/signup',
      data: formData,
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
    print(response);
    return response;

  }

  Future<Response> registerClient(RegisterClientModel registerModel,File file) async{
    final dio = Dio();

    final formData = FormData.fromMap({
      'client': MultipartFile.fromString(
        jsonEncode({
          "surname": registerModel.surname,
          "telephone" : registerModel.telephone,
          "adresse" : registerModel.adresse,
          "email" : registerModel.email,
          "login" : registerModel.login,
          "password" : registerModel.password
        }),
        contentType:MediaType('application', 'json'), // Utilisation de Headers.jsonContentType pour le JSON
      ),
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
        contentType: MediaType('image', file.path.split('.').last), // Remplace MediaType par une chaîne de caractères
      ),
    });
    final prefs = await SharedPreferences.getInstance();
    String? jwt = await prefs.getString("userToken");
    final response = await dio.post(
      'http://10.0.2.2:8080/clients/with-account',
      data: formData,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization' : 'Bearer $jwt'
        },
      ),
    );
    print(response);
    return response;

  }
}