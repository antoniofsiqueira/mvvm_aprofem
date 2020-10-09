import 'package:aprofrem_mvvm/app/data/sources/network/auth.service.dart';
import 'package:aprofrem_mvvm/app/domain/models/response.model.dart';
import 'package:aprofrem_mvvm/app/domain/repositories/account.repository.dart';
import 'package:aprofrem_mvvm/core/di/service_locator.dart';
import 'package:aprofrem_mvvm/device/connection/connection.helper.dart';

class AccountRepository implements IAccountRepository {
  AuthService service = serviceLocator<AuthService>();

  @override
  Future<ResponseModel> login(String login, String senha) async {
    ResponseModel response = ResponseModel();

    final hasConnection = await ConnectionHelper.hasConnection();

    if (hasConnection) {
      response = await this.service.login(login, senha);
    } else {
      response.message = "Device offline";
    }

    return response;
  }
}
