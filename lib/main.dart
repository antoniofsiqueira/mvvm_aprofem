import 'package:aprofrem_mvvm/core/di/service_locator.dart';
import 'package:flutter/material.dart';

import 'core/app.dart';

void main() async {
  await setupLocator();
  runApp(App());
}
