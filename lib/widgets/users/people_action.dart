import 'package:diploma_v1/fake_data/departments.dart';
import 'package:diploma_v1/fake_data/roles.dart';
import 'package:flutter/material.dart';

/// Form widgets are stateful widgets
class PeopleUpdateForm extends StatefulWidget {
  final user;
  PeopleUpdateForm({Key key, this.user}) : super(key: key);

  @override
  _PeopleUpdateFormState createState() => _PeopleUpdateFormState();
}

class _PeopleUpdateFormState extends State<PeopleUpdateForm> {
  final globalFormKey = GlobalKey<FormState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldState>();
  String departmentValue;
  List<bool> _isChecked;

  List<bool> getRoles(){
    List<bool> lst = [];
    for(var i = 0; i < ROLES_NAMES.length; ++i) {
      if (widget.user['roles'].contains(ROLES_NAMES[i])){
        lst.add(true);
      }
      else {
        lst.add(false);
      }
    }

    return lst;
  }

  void _handleUpdate(){

  }

  void _delete(){
    _handleDelete(context);
  }
  Future<void> _handleDelete(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Вы уверены что хотите удалить сотрудника ?'),

          actions: <Widget>[
            TextButton(
              child: Text('Да'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Нет'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    departmentValue = widget.user['department_name'];
    _isChecked = getRoles();
    print(departmentValue);
    print(ROLES_NAMES);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 600,
      //color: Colors.red,
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: globalFormKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Email: '),
                        ),

                        Flexible(
                          child: Text(widget.user['email']),
                        )
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('ФИО: '),
                        ),

                        Flexible(
                          child: Text(widget.user['fullname']),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Дата принятия на работу: '),
                        ),
                        Flexible(
                          child: Text(widget.user['created_at'].toString()),
                        )
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Дата изменения: '),
                        ),
                        Flexible(
                          child: Text(widget.user['updated_at'].toString()),
                        )
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Подразделение: '),
                        ),

                        DropdownButton<String>(
                          value: departmentValue,
                          elevation: 16,
                          style: const TextStyle(color: Colors.blueAccent),
                          underline: Container(
                            height: 2,
                            color: Colors.blueAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              departmentValue = newValue;
                            });
                          },
                          items: DEPARTMENTS_NAMES
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Должности: '),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: ROLES_NAMES.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                title: Text(ROLES_NAMES[index]),
                                value: _isChecked[index],
                                onChanged: (val) {
                                  setState(() {
                                    _isChecked[index] = val;
                                  },);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 70),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: _delete,
                            child: Text('Удалить сотрудника')
                        ),

                        ElevatedButton(
                            onPressed: _handleUpdate,
                            child: Text('Обновить сотрудника')
                        ),
                      ],
                    )
                   ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}