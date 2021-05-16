import 'package:diploma_v1/fake_data/departments.dart';
import 'package:diploma_v1/fake_data/roles.dart';
import 'package:diploma_v1/fake_data/tasks.dart';
import 'package:diploma_v1/widgets/tasks/taks_widget.dart';
import 'package:flutter/material.dart';


/// Form widgets are stateful widgets
class TasksWidget extends StatefulWidget {
  final state;
  final userDepartment;

  TasksWidget({Key key, this.state, this.userDepartment}) : super(key: key);

  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  final globalFormKey = GlobalKey<FormState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldState>();
  String departmentValue;
  final List<Map> tasks = <Map>[];

  final List<Tab> tabs = <Tab>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    departmentValue = DEPARTMENTS_NAMES[0];

    if (widget.userDepartment == 'null') {
      for (var i = 0; i < DEPARTMENTS_NAMES.length; ++i) {
        final item = Tab(text: DEPARTMENTS_NAMES[i]);

        tabs.add(item);
      }
    }
    else {
      final item = Tab(text: widget.userDepartment);

      tabs.add(item);
    }
    print(tabs);

    if (widget.state == statuses[0]){
      for (var i = 0; i< TASKS_FAKE.length; ++i) {
        final item = TASKS_FAKE[i];

        if (item['status'] == statuses[0])
          tasks.add(item);

      }
    }

    if (widget.state == statuses[1]){
      for (var i = 0; i< TASKS_FAKE.length; ++i) {
        final item = TASKS_FAKE[i];

        if (item['status'] == statuses[1])
          tasks.add(item);
      }
    }

    if (widget.state == statuses[2]){
      for (var i = 0; i < TASKS_FAKE.length; ++i) {
        final item = TASKS_FAKE[i];

        if (item['status'] == statuses[2])
          tasks.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 50.0,
            backgroundColor: Colors.black,
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.blue,
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return TasksDepartmentWidget(
                tasks: tasks,
                tab: tab.text,
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}