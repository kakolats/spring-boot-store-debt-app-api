class RegisterModel {
  String email;
  String password;
  String login;

  RegisterModel({
    required this.email,
    required this.password,
    required this.login,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json['email'],
      password: json['password'],
      login: json['login'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'login': login,
    };
  }
}
