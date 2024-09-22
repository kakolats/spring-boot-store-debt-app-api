import 'dart:convert';

class DebtModel {
  final int id;
  final DateTime date;
  final int amount;
  final bool paid;
  final int amountRemaining;

  DebtModel({
    required this.id,
    required this.date,
    required this.amount,
    required this.paid,
    required this.amountRemaining,
  });

  factory DebtModel.fromJson(Map<String, dynamic> json) {
    return DebtModel(
      id: json['id'],
      date: DateTime.parse(json['date']),
      amount: json['amount'],
      paid: json['paid'],
      amountRemaining: json['amountRemaining'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'amount': amount,
      'paid': paid,
      'amountRemaining': amountRemaining,
    };
  }
}
