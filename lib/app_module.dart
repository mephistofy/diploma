import 'package:flutter_modular/flutter_modular.dart';

import 'package:diploma_v1/screens/app.dart';
import 'package:diploma_v1/screens/login.dart';
import 'package:diploma_v1/screens/log_out.dart';
import 'package:diploma_v1/screens/tasks.dart';

class AppModule extends Module {

  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    //ChildRoute('/', child: (_, __) => Login()),
    ChildRoute('/', child: (_, __) => App()),
    ChildRoute('/home', child: (_, __) => App()),
    ChildRoute('/logout', child: (_, __) => LogOut()),

    ChildRoute('/workers', child: (_, __) => App()),
    ChildRoute('/departments', child: (_, __) => App()),
    ChildRoute('/unsorted_tasks', child: (_, __) => App()),
    ChildRoute('/tasks', child: (_, __) => Tasks()),
  ];

}