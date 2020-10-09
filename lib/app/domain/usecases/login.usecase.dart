import 'package:aprofrem_mvvm/app/data/repositories/account.repository.dart';
import 'package:aprofrem_mvvm/app/domain/models/response.model.dart';
import 'package:aprofrem_mvvm/core/di/service_locator.dart';

class LoginUseCase {
  final AccountRepository repository = serviceLocator<AccountRepository>();

  Future<ResponseModel> login(String login, String password) async {
    // your business logic..
    final ret = await repository.login(login, password);
    return ret;
  }
}
