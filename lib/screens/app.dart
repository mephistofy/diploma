import 'package:diploma_v1/widgets/home/invitations.dart';
import 'package:diploma_v1/widgets/home/requests.dart';
import 'package:flutter/material.dart';

import 'package:diploma_v1/side_drawers/side_drawers.dart';
import 'package:diploma_v1/widgets/home/statistics.dart';
import 'package:diploma_v1/side_drawers/app_bar.dart';

class App extends StatelessWidget {
  Widget styledText({fontSize: 14.0, text: ''}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final tabsFontSize = MediaQuery.of(context).size.width <= 320 ? 11.0 : 14.0;

    return Scaffold(
        drawer: SideDrawer(),
        appBar: customAppBar('Главная страница', context),
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
                          child: styledText(
                            text: 'Моя статистика',
                            fontSize: tabsFontSize
                          )
                        ),
                        Tab(
                          child: styledText(
                              text:  'Приглашения на должность',
                              fontSize: tabsFontSize
                          )
                        ),
                        Tab(
                          child: styledText(
                            text: 'Просьбы о вступлении в должность',
                            fontSize: tabsFontSize
                          )
                        ),
                      ]),
                  Container(
                      height: 1200.0,
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


