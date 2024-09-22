import 'package:show_debt_app/app/data/models/debt_model.dart';
import 'package:show_debt_app/app/modules/client/providers/client_provider.dart';

class ClientRepository{
  final ClientProvider _clientProvider = ClientProvider();

  Future<List<DebtModel>> getAllDebts() async {
    final response = await _clientProvider.getAllDebts();
    print(response);
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
}