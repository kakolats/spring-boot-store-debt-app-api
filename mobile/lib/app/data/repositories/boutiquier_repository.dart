import 'package:show_debt_app/app/data/models/client_model.dart';
import 'package:show_debt_app/app/data/models/debt_model.dart';
import 'package:show_debt_app/app/data/models/payment_model.dart';
import 'package:show_debt_app/app/modules/boutiquier/providers/boutiquier_provider.dart';

class BoutiquierRepository{
  final BoutiquierProvider _boutiquierProvider = BoutiquierProvider();

  Future<List<ClientModel>> getAllClients() async {
    final response = await _boutiquierProvider.getAllClients();
    if (response.statusCode == 200) {
      List<ClientModel> clients = [];
      List<dynamic> datas=response.body;
      for (var data in datas) {
        clients.add( ClientModel.fromJson(data));
      }
      return clients;
    }
    return [];
  }

  Future<List<DebtModel>> getClientDebts(String id) async {
    final response = await _boutiquierProvider.getClientDebts(id);
    if (response.statusCode == 200) {
      List<DebtModel> debts = [];
      List<dynamic> datas=response.body;
      for (var data in datas) {
        debts.add( DebtModel.fromJson(data));
      }
      return debts;
    }
    return [];
  }

  Future<List<PaymentModel>> getDebtPayments(String id) async {
    final response = await _boutiquierProvider.getDebtPayments(id);
    if (response.statusCode == 200) {
      List<PaymentModel> payments = [];
      List<dynamic> datas=response.body;
      for (var data in datas) {
        payments.add( PaymentModel.fromJson(data));
      }
      return payments;
    }
    return [];
  }

  Future<String?> createDebt(String id,String amount) async {
    final response = await _boutiquierProvider.createDebt(id,amount);
    if (response.statusCode == 200) {
      String? rep = response.statusText;
      return rep;
    }
    return null;
  }

  Future<String?> createPayment(String id,String amount) async {
    final response = await _boutiquierProvider.createPayment(id,amount);
    if (response.statusCode == 200) {
      String? rep = response.statusText;
      return rep;
    }
    return null;
  }
}