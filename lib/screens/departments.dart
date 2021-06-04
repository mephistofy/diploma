import 'package:diploma_v1/constants/colors.dart';
import 'package:diploma_v1/fake_data/departments.dart';
import 'package:diploma_v1/helpers/button_styled.dart';
import 'package:diploma_v1/helpers/hover_container.dart';
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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: SideDrawer(),
      appBar: customAppBar('Отделы', context),
      body:
      Column(
        children: <Widget>[
          width > 320.0
          ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30.0,
              ),
              Flexible(
                  child: buildSearch()
              ),

              SizedBox(
                width: 30.0,
              ),
              button_styled(
                action: performAddDepartment,
                padding: width <= 320 ? EdgeInsets.only(top: 10.0,right: 20.0) : EdgeInsets.all(0.0),
                child: Text('Добавить отдел')
              ),

            ],
          )
          : Container(
            height: 150.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 30.0,
                ),
                Flexible(
                    child: buildSearch()
                ),

                SizedBox(
                  width: 30.0,
                ),
                button_styled(
                    action: performAddDepartment,
                    padding: width <= 320 ? EdgeInsets.only(top: 10.0,right: 20.0, bottom: 20.0 ) : EdgeInsets.all(0.0),
                    child: Text('Добавить отдел')
                ),

              ],
            ),
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
    final width = MediaQuery.of(context).size.width;

    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return width > 320.0 ? AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            scrollable: true,
            title: Center(
              child: Text(
                  'Создание нового отдела',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -50.0 ,
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
        )
            : Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
          ),
        body: DepartmentAddForm(),
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
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

  Widget buildDepartment(var department) => hover_container(
    height: 50.0,
    hoverHeight: 60.0,
    margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
    hoverMargin: EdgeInsets.all(20.0),
    child: ListTile(
        title: Text(department['name']),
        onTap: () => showDepartment(context, department)
    )
  );


  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Введите название подразделения',
    onChanged: searchDepartment,
  );

  void searchDepartment(String query) {
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