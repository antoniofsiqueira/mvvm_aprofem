import 'package:aprofrem_mvvm/app/domain/models/response.model.dart';

abstract class IAccountRepository {
  Future<ResponseModel> login(String login, String senha);
}
