import 'package:diploma_v1/helpers/shared_prefs_helper.dart';
import 'package:diploma_v1/widgets/tasks/tasks.dart';
import 'package:flutter/material.dart';

import 'package:diploma_v1/side_drawers/side_drawers.dart';
import 'package:diploma_v1/side_drawers/app_bar.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: CustomAppBar('Заявки'),
      body: byUserDepartmentBuilder(context)
    );
  }

  Future<Widget> byUserDepartment(context) async{
    final user = await CustomSharedPrefs.getObject("user");
    final userDepartment = user['department'];

    print(userDepartment );

    return ListView(children: [
      DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.blue,
                  tabs: [
                    Tab(
                      child: Text(
                        'Доступные заявки',
                        //style: TextStyle(fontFamily: "BarlowBold", color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'В процесе выполнения',
                        //style: TextStyle(fontFamily: "BarlowBold", color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Завершенные',
                        //style: TextStyle(fontFamily: "BarlowBold", color: Colors.black),
                      ),
                    ),
                  ]),
              Container(
                  height: 1000.0,
                  child: TabBarView(
                    children: [
                      Center(
                        child: TasksWidget(state: 'available', userDepartment: userDepartment,),
                      ),
                      Center(
                        child: TasksWidget(state: 'inProgress', userDepartment: userDepartment,),
                      ),
                      Center(
                        child: TasksWidget(state: 'completed', userDepartment: userDepartment,),
                      ),
                    ],
                  )
              )
            ],
          )
      )
    ]);
  }

  Widget byUserDepartmentBuilder(context){
    return FutureBuilder<Widget>(
        future: byUserDepartment(context), // a previously-obtained Future<String> or null
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
    );
  }
}