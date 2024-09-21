import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

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
}