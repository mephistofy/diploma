import 'package:diploma_v1/constants/colors.dart';
import 'package:diploma_v1/helpers/shared_prefs_helper.dart';
import 'package:diploma_v1/models/user.dart';
import 'package:diploma_v1/screens/log_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:diploma_v1/constants/constants.dart';

class SideDrawer extends StatelessWidget {
  Widget _getHeadSideDrawerWidget (final user){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0 ),
      child: Center(
        child: Column(
          children: [
            Text(APP_TITLE,
              textAlign: TextAlign.center,
               style: TextStyle(color: Colors.white, fontSize: 14),
            ),

            SizedBox(height: 20),

        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 5)],
            border: new Border.all(
              color: Colors.white,
              width: 4.0,
            ),
          ),

          child:             CircleAvatar(
            radius: 65.0,
            backgroundImage:
            NetworkImage(user.avatar),
            backgroundColor: Colors.transparent,
          ),
        ),


            SizedBox(height: 10),

            Text(user.fullname,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),

            SizedBox(height: 10),

            Text(user.email,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ]
        )
      ),
    );
  }

  Future<Widget> _contractCheck(context) async {
    final object = await CustomSharedPrefs.getObject("user");
    final user = User.fromJson(object);

    return Column(
      children: <Widget>[
        Container(
          height: 330.0,
          child: DrawerHeader(
            child: _getHeadSideDrawerWidget(user),
            decoration: BoxDecoration(
              color: additionalColor,
            ),
          ),
        ),

        ListTile(
          leading: Icon(Icons.trending_up),
          title: Text('Главная страница'),
          onTap: () => {
            Modular.to.pushNamed('/home')
          },
        ),

        if (user.roles.contains('topManager') || user.roles.contains('sorter'))
          ListTile(
            leading: Icon(Icons.work_off_outlined),
            title: Text('Несортированные заявки'),
            onTap: () => {
              Modular.to.pushNamed('/unsorted_tasks')
            },
          ),

        //if (!testRole.contains('sorter'))
          ListTile(
            leading: Icon(Icons.work_rounded),
            title: Text('Заявки'),
            onTap: () => {
              Modular.to.pushNamed('/tasks')
            },
          ),

        if (user.roles.contains('manager') || user.roles.contains('topManager'))
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Сотрудники'),
            onTap: () => {
              Modular.to.pushNamed('/people')
            },
          ),

        if (user.roles.contains('manager') || user.roles.contains('topManager'))
          ListTile(
            leading: Icon(Icons.storage),
            title: Text('Отделы'),
            onTap: () => {
              Modular.to.pushNamed('/departments')
            },
          ),

        ListTile(
          leading: Icon(Icons.account_balance_rounded),
          title: Text('Мой аккаунт'),
          onTap: () => {
            Modular.to.pushNamed('/my_account')
          },
        ),

        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Выйти'),
          onTap: () => {
            LogOut.perform(context)
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child:       FutureBuilder<Widget>(
            future: _contractCheck(context), // a previously-obtained Future<String> or null
            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data;
              }
              else if (snapshot.hasError){
                return Text('error');
              }
              else {
                return SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                );
              }
            }
        )
      )
    );
  }
}






