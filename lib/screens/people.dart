import 'package:diploma_v1/fake_data/users.dart';
import 'package:diploma_v1/side_drawers/app_bar.dart';
import 'package:diploma_v1/side_drawers/side_drawers.dart';
import 'package:diploma_v1/widgets/users/add_user.dart';
import 'package:diploma_v1/widgets/users/people_action.dart';
import 'package:diploma_v1/widgets/search.dart';
import 'package:flutter/material.dart';

class PeopleScreen extends StatefulWidget {
  PeopleScreen({Key key}) : super(key: key);

  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  String query = '';
  var peopleList;

  @override
  void initState() {
    super.initState();

    peopleList = fakeUsers;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        appBar: CustomAppBar('Сотрудники'),
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
                    onPressed: performAddUser,//performAddDepartment,
                    child: Text('Добавить сотрудника')
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

  void performAddUser(){
    addUser(context);
  }
  Future<void> addUser(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true,
            title: Center(
              child: Text('Добавить сотрудника'),
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

                PeopleAddForm(),
              ],
            )
        );
      },
    );
  }

  Future<void> showUser(context, user) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Center(
           child: Text(user['fullname']),
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

              PeopleUpdateForm(user: user),
            ],
          )
        );
      },
    );
  }

  Widget body (){
    //print(peopleList[0]['avatar']);

    return Expanded(
        child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: peopleList.length,
            itemBuilder: (BuildContext context, int index){
              final user = peopleList[index];
              return buildUser(user);
            }
        )
    );
  }

  Widget buildUser(var user) => ListTile(
    leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(user['avatar'])),
    title: Text(user['fullname']),
    subtitle: Text(user['email']),
    trailing: user['department_name'] != null ? Text(user['department_name']) : Text(''),
      onTap: () => showUser(context, user)
  );

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Введите имя, подразделение или email',
    onChanged: searchBook,
  );

  void searchBook(String query) {
    print(query);
    final users = fakeUsers.where((user) {
      final titleLower = user['email'].toString().toLowerCase();
      final authorLower = user['fullname'].toString().toLowerCase();
      final departmentLower = user['department_name'].toString().toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower) ||
          departmentLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.peopleList = users;
    });
  }
}
