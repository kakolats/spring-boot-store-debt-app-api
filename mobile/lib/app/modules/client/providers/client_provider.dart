import 'package:get/get.dart';

import '../../../data/services/auth_interceptor.dart';

class ClientProvider extends GetConnect {
  final GetConnect connect = Get.find<AuthInterceptor>();
  @override
  void onInit() {
    httpClient.baseUrl = '10.0.0.2:8080';
  }

  Future<Response> getAllDebts() async {
    final response = await connect.get(
        '/debts/me',  // Login API endpoint
    );
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
