import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://yourapi.com'; // Set your API base URL here
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
