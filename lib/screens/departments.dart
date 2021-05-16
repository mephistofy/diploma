import 'package:diploma_v1/fake_data/departments.dart';
import 'package:diploma_v1/side_drawers/app_bar.dart';
import 'package:diploma_v1/side_drawers/side_drawers.dart';
import 'package:diploma_v1/widgets/departments/department_top_manager/department_action.dart';
import 'package:diploma_v1/widgets/departments/department_top_manager/department_add.dart';
import 'package:diploma_v1/widgets/search.dart';
import 'package:flutter/material.dart';

class Departments extends StatefulWidget {
  Departments ({Key key}) : super(key: key);

  @override
  _DepartmentsState createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments > {
  String query = '';
  var departmentsList;

  @override
  void initState() {
    super.initState();

    departmentsList = DEPARTMENTS_FAKE;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: CustomAppBar('Отделы'),
      body:
      Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: buildSearch()
              ),

              SizedBox(
                width: 30.0,
              ),
              ElevatedButton(
                  onPressed: performAddDepartment,
                  child: Text('Добавить отдел')
              ),
              SizedBox(
                width: 30.0,
              ),
            ],
          ),
          body(),
        ],
      ),
    );
  }

  void performAddDepartment(){
    addDepartment(context);
  }
  
  Future<void> addDepartment(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true,
            title: Center(
              child: Text('Создание нового отдела'),
            ),
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -50.0,
                  top: -90.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),

                DepartmentAddForm(),
              ],
            )
        );
      },
    );
  }

  Future<void> showDepartment(context, department) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true,
            title: Center(
              child: Text(department['name']),
            ),
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -50.0,
                  top: -90.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),

                DepartmentUpdateForm(department: department),
              ],
            )
        );
      },
    );
  }

  Widget body (){
    return Expanded(
        child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: departmentsList.length,
            itemBuilder: (BuildContext context, int index){
              final department = departmentsList[index];
              return buildDepartment(department);
            }
        )
    );
  }

  Widget buildDepartment(var department) => ListTile(
      title: Text(department['name']),
      onTap: () => showDepartment(context, department)
  );

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Введите название подразделения',
    onChanged: searchBook,
  );

  void searchBook(String query) {
    print(query);
    final users = DEPARTMENTS_FAKE.where((department) {
      final titleLower = department['name'].toString().toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.departmentsList = users;
    });
  }
}