import 'package:diploma_v1/widgets/home/invitations.dart';
import 'package:diploma_v1/widgets/home/requests.dart';
import 'package:flutter/material.dart';

import 'package:diploma_v1/side_drawers/side_drawers.dart';
import 'package:diploma_v1/widgets/home/statistics.dart';
import 'package:diploma_v1/side_drawers/app_bar.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        appBar: CustomAppBar('Главная страница'),
        body: ListView(children: [
          DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.blue,
                      tabs: [
                        Tab(
                          child: Text(
                            'Моя статистика',
                            //style: TextStyle(fontFamily: "BarlowBold", color: Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Приглашения на должность',
                            //style: TextStyle(fontFamily: "BarlowBold", color: Colors.black),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Просьбы о вступлении в должность',
                            //style: TextStyle(fontFamily: "BarlowBold", color: Colors.black),
                          ),
                        ),
                      ]),
                  Container(
                      height: 900.0,
                      child: TabBarView(
                        children: [
                          Statistics(),
                          InvitationsScreen(),
                          RequestsScreen(),
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


