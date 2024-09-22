class PaymentModel{
  final int id;
  final DateTime date;
  final int amount;

  PaymentModel({
    required this.id,
    required this.date,
    required this.amount,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      date: DateTime.parse(json['date']),
      amount: json['amount']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'amount': amount
    };
  }
}