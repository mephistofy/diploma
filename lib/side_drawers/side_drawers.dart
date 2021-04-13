import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:diploma_v1/constants/constants.dart';

final List<String> roles = ['worker', 'sorter', 'manager', 'topManager'];
final List<String> onlyWorker = ['worker'];
final List<String> allRoles = ['worker', 'sorter', 'manager', 'topManager'];

class SideDrawer extends StatelessWidget {
  Widget _getHeadSideDrawerWidget (final String workerName, final String workerEmail){
    return Center(
      child: Column(
          children: [
            Text(APP_TITLE,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(workerEmail,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(workerName,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14),
            )
          ]
      )
    );
  }

  Widget _contractCheck(BuildContext context){
    var testRole = allRoles;

    final String workerName = 'Борис Борисович';
    final String workerEmail = 'testemail@gmail.com';

    return Column(
      children: <Widget>[
        DrawerHeader(
          child: _getHeadSideDrawerWidget(workerName, workerEmail),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
        ),

        ListTile(
          leading: Icon(Icons.home),
          title: Text('Статистика'),
          onTap: () => {
            Modular.to.navigate('/home')
          },
        ),

        if (testRole.contains('topManager') || testRole.contains('sorter'))
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Несортированные заявки'),
            onTap: () => {
              Modular.to.navigate('/unsorted_tasks')
            },
          ),

        //if (!testRole.contains('sorter'))
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Заявки'),
            onTap: () => {
              Modular.to.navigate('/tasks')
            },
          ),

        if (testRole.contains('manager') || testRole.contains('topManager'))
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Сотрудники'),
            onTap: () => {
              Modular.to.navigate('/workers')
            },
          ),

        if (testRole.contains('manager') || testRole.contains('topManager'))
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Отделы'),
            onTap: () => {
              Modular.to.navigate('/departments')
            },
          ),

        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Выйти'),
          onTap: () => {
            Modular.to.navigate('/logout')
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: _contractCheck(context),
    );
  }
}






