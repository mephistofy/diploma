import 'package:flutter/material.dart';

import 'package:diploma_v1/side_drawers/side_drawers.dart';
import 'package:diploma_v1/side_drawers/app_bar.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: CustomAppBar(),
      body: ListView(children: [

      DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(tabs: [Tab(text: 'Home'), Tab(text: 'News')]),
              Container(
                  height: 300.0,
                  child: TabBarView(
                    children: [
                      Center(child: Text('Home here')),
                      Center(child: Text('News here')),
                      ],
                  ))
            ],
          ))
    ]) 
    
    );
    
  }
}