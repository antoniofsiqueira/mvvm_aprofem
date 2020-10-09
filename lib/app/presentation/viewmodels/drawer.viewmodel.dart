import 'package:aprofrem_mvvm/app/data/sources/storage/storage.helper.dart';
import 'package:aprofrem_mvvm/app/presentation/pages/login/login.page.dart';
import 'package:aprofrem_mvvm/device/nav/nav_no_animation.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

part 'drawer.viewmodel.g.dart';

class DrawerViewModel = _DrawerViewModelBase with _$DrawerViewModel;

abstract class _DrawerViewModelBase with Store {
  void logout(BuildContext context) {
    StorageHelper.set(StorageKeys.token, "");
    StorageHelper.set(StorageKeys.login, "");
    StorageHelper.set(StorageKeys.senha, "");

    Navigator.pushReplacement(context, NavNoAnimation(page: LoginPage()));
  }
}
