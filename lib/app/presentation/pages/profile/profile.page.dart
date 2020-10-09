import 'package:aprofrem_mvvm/app/presentation/widgets/text.dart';
import 'package:flutter/material.dart';

import 'profile.widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProfileWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText(text: "Profile Page")),
    );
  }
}
