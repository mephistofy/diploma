import 'package:diploma_v1/screens/departments.dart';
import 'package:diploma_v1/screens/people.dart';
import 'package:diploma_v1/screens/unsorted_tasks.dart';
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
    ChildRoute('/login', child: (_, __) => Login()),
    //ChildRoute('/', child: (_, __) => App()),
    ChildRoute('/home', child: (_, __) => App()),

    ChildRoute('/people', child: (_, __) => PeopleScreen()),
    ChildRoute('/departments', child: (_, __) => Departments()),
    ChildRoute('/unsorted_tasks', child: (_, __) => UnsourcedTasks()),
    ChildRoute('/tasks', child: (_, __) => Tasks()),
  ];

}