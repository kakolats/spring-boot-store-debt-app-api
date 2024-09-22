class RegisterClientModel{
  String surname;
  String telephone;
  String adresse;
  String email;
  String password;
  String login;

  RegisterClientModel({
    required this.surname,
    required this.telephone,
    required this.adresse,
    required this.email,
    required this.password,
    required this.login,
  });

  factory RegisterClientModel.fromJson(Map<String, dynamic> json) {
    return RegisterClientModel(
      surname: json['surname'],
      telephone: json['telephone'],
      adresse: json['adresse'],
      email: json['email'],
      password: json['password'],
      login: json['login'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'surname': surname,
      'telephone': telephone,
      'adresse': adresse,
      'email': email,
      'password': password,
      'login': login,
    };
  }
}