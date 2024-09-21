class ClientModel {
  final String surname;
  final String telephone;
  final String adresse;
  final bool hasAccount;
  final int cumulDettes;
  final int id;

  ClientModel({
    required this.surname,
    required this.telephone,
    required this.adresse,
    required this.hasAccount,
    required this.cumulDettes,
    required this.id,
  });

  // Factory constructor to create a ClientModel from a JSON map
  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      surname: json['surname'],
      telephone: json['telephone'],
      adresse: json['adresse'],
      hasAccount: json['hasAccount'],
      cumulDettes: json['cumulDettes'],
      id: json['id'],
    );
  }

  // Method to convert a ClientModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'surname': surname,
      'telephone': telephone,
      'adresse': adresse,
      'hasAccount': hasAccount,
      'cumulDettes': cumulDettes,
      'id': id,
    };
  }
}
