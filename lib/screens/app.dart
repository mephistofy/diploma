import 'package:flutter/material.dart';

import 'package:diploma_v1/side_drawers/side_drawers.dart';
import 'package:diploma_v1/screens/statistics.dart';
import 'package:diploma_v1/side_drawers/app_bar.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        appBar: CustomAppBar(),
        body: Statistics()
    );
  }
}


