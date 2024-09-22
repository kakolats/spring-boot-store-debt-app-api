import 'package:get/get.dart';
import 'package:show_debt_app/app/data/services/auth_interceptor.dart';

class BoutiquierProvider extends GetConnect {
  final GetConnect connect = Get.find<AuthInterceptor>();
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }
  Future<Response> getAllClients() async{
    final response = await connect.get(
      '/clients',  // Login API endpoint
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

  Future<Response> getClientDebts(String id) async{
    final response = await connect.get(
      '/debts/$id',  // Login API endpoint
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
