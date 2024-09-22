import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://10.0.2.2:8080'; // Set your API base URL here
    httpClient.addRequestModifier<void>((request) async {
      final token = await _getToken();
      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';  // Add Bearer token
      }
      return request;
    });
    super.onInit();
  }

  // Helper method to retrieve the token from SharedPreferences
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }
}
