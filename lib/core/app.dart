import 'package:aprofrem_mvvm/app/presentation/pages/login/login.page.dart';
import 'package:aprofrem_mvvm/core/values/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, theme: appTheme, home: LoginPage());
  }
}
