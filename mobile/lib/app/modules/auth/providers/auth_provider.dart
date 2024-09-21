import 'dart:io';

import 'package:get/get.dart';
import 'package:show_debt_app/app/data/models/register_model.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = '10.0.0.2:8080';
  }
  Future<Response> login(String username, String password) async {
    final response = await post(
        'http://10.0.2.2:8080/auth/login',  // Login API endpoint
        {'login': username, 'password': password}
    );
    //print(response.body);
    if (response.status.hasError) {
      return Response(statusCode: response.statusCode, statusText: response.statusText);
    } else {
      // Assuming the token is returned in response body under 'token' key
      //String token = response.body['token'];
      // Store the token using SharedPreferences or securely using flutter_secure_storage
      //await saveToken(token);
      return response;
    }
  }

  /*Future<Response> register(RegisterModel registerModel,File file) async{
    final formData = FormData({
      'file': [
        MultipartFile(
          file.path,
          filename: file.path.split('/').last,
        )
      ],
      'user': registerModel.toJson()
    });

    final response = await post('http://10.0.2.2:8080/auth/signup', formData);
    print(response);
    if (response.status.hasError) {
      return Response(statusCode: response.statusCode, statusText: response.statusText);
    } else {
      // Assuming the token is returned in response body under 'token' key
      //String token = response.body['token'];
      // Store the token using SharedPreferences or securely using flutter_secure_storage
      //await saveToken(token);
      return response;
    }
  }*/

  Future<Response> register(RegisterModel registerModel,File file) async{
    final registerInfos = registerModel.toJson();
    final registerFile = MultipartFile(registerInfos, filename: 'user.json', contentType: 'application/json');
    final imageFile = await MultipartFile(File(file.path).readAsBytes(), filename: file.path.split('/').last, contentType: 'image/${file.path.split('.').last}');
    final formData = FormData({
      'user': registerFile,
      'file': imageFile,
    });

    final response = await post('http://10.0.2.2:8080/auth/signup', formData);
    print(response);
    if (response.status.hasError) {
      return Response(statusCode: response.statusCode, statusText: response.statusText);
    } else {
      // Assuming the token is returned in response body under 'token' key
      //String token = response.body['token'];
      // Store the token using SharedPreferences or securely using flutter_secure_storage
      //await saveToken(token);
      return response;
    }
  }
}
