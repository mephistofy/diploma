import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:diploma_v1/app_module.dart';

void main() => runApp(ModularApp(module: AppModule(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
    ).modular();
  }
}




