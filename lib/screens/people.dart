import 'package:diploma_v1/constants/colors.dart';
import 'package:diploma_v1/fake_data/users.dart';
import 'package:diploma_v1/helpers/button_styled.dart';
import 'package:diploma_v1/helpers/hover_container.dart';
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
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        drawer: SideDrawer(),
        appBar: customAppBar('Сотрудники', context),
        body:
        Column(
          children: <Widget>[
            width > 320 ?
            Row(
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
                  action: performAddUser,
                  child: Text('Добавить сотрудника')
                ),

                SizedBox(
                  width: 60.0,
                ),
              ],
            )
            : Container(
              height: 160.0,
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    child: buildSearch()
                ),

                SizedBox(
                  height: 20.0,
                ),
                button_styled(
                    action: performAddUser,
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text('Добавить сотрудника')
                ),

              ],
            ),
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
    final width = MediaQuery.of(context).size.width;

    if (width > 320.0) {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
    else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
        ),
        body: PeopleUpdateForm(user: user),
      );
    }
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

  Widget buildUser(var user) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      child: hover_container(
          height: width > 320.0 ? 80.0 : 120.0,
          hoverHeight: 100.0,
          padding: width > 320.0 ? EdgeInsets.only(top: 5.0) : EdgeInsets.only(top: 0.0),
          hoverPadding: EdgeInsets.only(top: 10.0),
          margin: width > 320.0 ? EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0) : EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0) ,
          hoverMargin: EdgeInsets.all(20.0),
          child: width > 320.0 ? ListTile(
              leading:                            CircleAvatar(
                radius: 65.0,
                backgroundImage:
                NetworkImage('data:image/jpeg;base64,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'),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                  user['fullname']
              ),
              subtitle: Text(
                  user['email']
              ),
              trailing: user['department_name'] != null ? Text(user['department_name']) : Text(''),
              onTap: () => showUser(context, user)
          )
              : Container(
                //width: 200.0,
                //height: 200.0,
                child:  Row(
                  children: [
                    CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(user['avatar'])
                    ),

                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                            user['fullname'],
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        Text(
                            user['email'],
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),


                        user['department_name'] != null
                            ? Text(
                                user['department_name'],
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                            )
                            : Text(''),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
      onTap: () => showUser(context, user)

    );
  }

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Введите имя, подразделение или email',
    onChanged: searchUser,
  );

  void searchUser(String query) {
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
