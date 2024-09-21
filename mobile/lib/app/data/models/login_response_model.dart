class LoginResponse {
  final String token;
  final int expiresIn;
  final String role;

  LoginResponse({required this.token, required this.expiresIn,required this.role});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        token: json['token'],
        expiresIn: json['expiresIn'],
        role: json['role']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expiresIn': expiresIn,
      'role' : role
    };
  }
}