import 'package:diploma_v1/side_drawers/app_bar.dart';
import 'package:diploma_v1/side_drawers/side_drawers.dart';
import 'package:flutter/material.dart';

class UnsourcedTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        appBar: CustomAppBar(),
        body: Center(
          child: Text("Несортированные заявки"),
        )

    );
  }
}
