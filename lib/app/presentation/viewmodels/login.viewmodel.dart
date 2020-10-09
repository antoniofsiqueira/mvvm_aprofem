import 'package:aprofrem_mvvm/app/domain/models/response.model.dart';
import 'package:aprofrem_mvvm/app/domain/usecases/login.usecase.dart';
import 'package:aprofrem_mvvm/core/di/service_locator.dart';
import 'package:mobx/mobx.dart';

part 'login.viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final _uc = serviceLocator<LoginUseCase>();

  @observable
  bool isLoading = false;

  @action
  _setLoading(bool value) => isLoading = value;

  @observable
  String login = "";

  @action
  setLogin(String value) => login = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => password = value;

  Future<bool> signIn() async {
    _setLoading(true);
    print("###### RESPONSE DOS CAMPOS LOGIN ######");
    print("Login = $login /n Senha = $password");
    print("###### RESPONSE DOS CAMPOS LOGIN ######");

    await Future.delayed(Duration(seconds: 2));

    ResponseModel ret = await _uc.login(login, password);

    _setLoading(false);

    if (ret.status == 200) {
      print("###### Status da Conexão ######");
      print("Status = " + ret.status.toString());
      print("###### Status da Conexão ######");
      return true;
    }

    return false;
  }
}
