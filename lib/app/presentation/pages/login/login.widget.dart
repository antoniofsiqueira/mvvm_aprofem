import 'package:aprofrem_mvvm/app/presentation/viewmodels/login.viewmodel.dart';
import 'package:aprofrem_mvvm/app/presentation/widgets/button.dart';
import 'package:aprofrem_mvvm/app/presentation/widgets/edit_text.dart';
import 'package:aprofrem_mvvm/app/presentation/widgets/logo.dart';
import 'package:aprofrem_mvvm/app/presentation/widgets/snackbar.dart';
import 'package:aprofrem_mvvm/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:aprofrem_mvvm/core/values/dimens.dart' as dimens;

class LoginWidget {
  final vm = serviceLocator<LoginViewModel>();

  Widget form(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    return Padding(
      padding: EdgeInsets.all(dimens.margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Logo(),
          SizedBox(height: 20),
          EditText(
            placeholder: "LOGIN",
            value: vm.login,
            onChange: (value) => vm.setLogin(value),
          ),
          SizedBox(height: 10),
          EditText(
            placeholder: "PASSWORD",
            value: vm.password,
            onChange: (value) => vm.setPassword(value),
          ),
          SizedBox(height: 20),
          CustomButton(
              label: "Entrar",
              onPress: () async {
                final ret = await vm.signIn();

                if (ret) {
                  CustomSnackbar(scaffoldKey, message: "SUCCESS");
                } else {
                  CustomSnackbar(scaffoldKey,
                      message: "NOT FOUND", actionMessage: "OK", action: () {
                    print("ACTION CLICKED");
                  });
                }
              })
        ],
      ),
    );
  }
}
