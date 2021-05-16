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
      body: ListView(children: [

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
                  height: 500.0,
                  child: TabBarView(
                    children: [
                      Center(
                        child: TasksWidget(),
                      ),
                      Center(
                        child: TasksWidget(),
                      ),
                      Center(
                        child: TasksWidget(),
                      ),
                    ],
                  )
              )
            ],
          )
      )
    ])
    );
  }
}