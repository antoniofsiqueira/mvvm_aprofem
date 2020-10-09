import 'package:aprofrem_mvvm/app/presentation/viewmodels/drawer.viewmodel.dart';
import 'package:aprofrem_mvvm/app/presentation/widgets/text.dart';
import 'package:aprofrem_mvvm/core/di/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aprofrem_mvvm/core/values/colors.dart' as colors;

//import 'package:flutter_architecture/core/values/colors.dart' as colors;

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final vm = serviceLocator<DrawerViewModel>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: colors.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  //USER ACCOUNT HEADER

                  UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: colors.accentColor),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Center(
                          child:
                              CustomText(text: "FS", accent: true, title: true),
                        ),
                        //backgroundImage: NetworkImage('https://avatars3.githubusercontent.com/u/4768926?s=400&v=4')
                      ),
                      accountName: CustomText(
                          dark: true, bold: true, text: "Fulano da Silva"),
                      accountEmail: null),
                ],
              ),
            ),

            // SAIR / LOGOUT

            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                  onTap: () => vm.logout(context),
                  leading: Icon(
                    Icons.exit_to_app,
                    color: colors.primaryColor,
                  ),
                  title: CustomText(text: "Exit")),
            )
          ],
        ),
      ),
    );
  }
}
