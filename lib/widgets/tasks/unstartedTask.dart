import 'package:diploma_v1/fake_data/departments.dart';
import 'package:diploma_v1/fake_data/tasks.dart';
import 'package:diploma_v1/fake_data/users.dart';
import 'package:diploma_v1/helpers/shared_prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

/// Form widgets are stateful widgets
class UnstartedTaskUpdateForm extends StatefulWidget {
  final task;
  UnstartedTaskUpdateForm({Key key, this.task}) : super(key: key);

  @override
  _UnstartedUpdateFormState createState() => _UnstartedUpdateFormState();
}

class _UnstartedUpdateFormState extends State<UnstartedTaskUpdateForm> {
  final globalFormKey = GlobalKey<FormState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldState>();
  String departmentValue;
  final List<String> departmentUsers = <String>[];
  String departmentUserValue;

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
          title: Text('Вы уверены что хотите удалить отдел ?'),

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

    for (var i = 0; i<fakeUsers.length; ++i ) {
      final item = fakeUsers[i];

      //print('--ffffffffffffff-fffffffffff-fffffff-');
      //print(item['department_name']);
      //print(widget.task['department']);
      if (item['department_name'] == widget.task['department']['name'] ){
        departmentUsers.add(item['fullname']);
      }
    }

    //print(departmentUsers);

    departmentUserValue = departmentUsers[0];

    if (widget.task['department'] != null) {
      departmentValue = widget.task['department']['name'];
    }
    else {
      departmentValue = DEPARTMENTS_NAMES[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 1000,
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
                          child: Text('Отправитель: '),
                        ),

                        Flexible(
                          child: Text(widget.task['sender']),
                        )
                      ],
                    ),

                    SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Дата получения: '),
                        ),
                        Flexible(
                          child: Text(widget.task['created_at'].toString()),
                        )
                      ],
                    ),

                    SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Дата выполнения: '),
                        ),
                        Flexible(
                          child: Text(widget.task['updated_at'].toString()),
                        )
                      ],
                    ),

                    SizedBox(height: 50),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text('Примечание для исполнителя: '),
                          ),

                          commentState(),
                        ]
                    ),

                    SizedBox(height: 50),

                    SingleChildScrollView(
                      child: Text(
                        widget.task['content'],
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 50),

                    managersActionState(context),

                    SizedBox(height: 50),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Widget> managersActions(context) async {
    final user = await CustomSharedPrefs.getObject("user");
    final roles = user['roles'];

    if (widget.task['status'] == statuses[0]) {
      if (roles.contains('manager') || roles.contains('topManager')) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text('Подразделение: '),
                ),
                SizedBox(
                  width: 10.0,
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
                ),

                SizedBox(
                  width: 10.0,
                ),

                ElevatedButton(
                    onPressed: _handleUpdate,
                    child: Text('Перенаправить')
                ),
              ],
            ),

            SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text('Назначить исполнителя: '),
                ),

                SizedBox(
                  width: 10.0,
                ),

                DropdownButton<String>(
                  value: departmentUserValue,
                  elevation: 16,
                  style: const TextStyle(color: Colors.blueAccent),
                  underline: Container(
                    height: 2,
                    color: Colors.blueAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      departmentUserValue = newValue;
                    });
                  },
                  items: departmentUsers
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

                SizedBox(
                  width: 10.0,
                ),

                ElevatedButton(
                    onPressed: _handleUpdate,
                    child: Text('Назначить')
                ),

              ],
            ),

            SizedBox(height: 50),

            buttomButtons(context),
          ],
        );
      }
      else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: _handleUpdate,
                child: Text('Начать задачу')
            ),
          ],
        );
      }
    }
    else if (widget.task['status'] == statuses[1]){
      return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: _handleUpdate,
            child: Text('Завершить')
          ),
        ]
      );
    }
    else {
      return Text('');
    }
  }

  Widget buttomButtons(context){
     return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              child:           ElevatedButton(
                  onPressed: _delete,
                  child: Text('Удалить задачу')
              ),
          ),
          SizedBox(
            width: 10.0,
          ),

          Expanded(
              child:           ElevatedButton(
                  onPressed: _handleUpdate,
                  child: Text('Обновить задачу')
              ),
          ),

          SizedBox(
            width: 10.0,
          ),

          Expanded(
              child:           ElevatedButton(
                  onPressed: _handleUpdate,
                  child: Text('Начать задачу')
              ),
          ),
        ],
      );
  }

  Widget managersActionState(context){
    return FutureBuilder<Widget>(
        future: managersActions(context), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data;
          }
          else if (snapshot.hasError){
            return Text('error');
          }
          else {
            return SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            );
          }
        }
    );
  }

  Future<Widget> getUserRole() async {
    final user = await CustomSharedPrefs.getObject("user");
    final roles = user['roles'];

    if (widget.task['status'] != statuses[2]) {
      if (roles.contains('manager') || roles.contains('topManager')) {
        return Flexible(
          child: TextFormField(
            maxLines: 2,
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),

              ),
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              hintText: widget.task['comment'] != null
                  ? widget.task['comment']
                  : "Введите текст...",
            ),
            key: Key("_name"),
            keyboardType: TextInputType.text,
            onSaved: (String value) {
              //_name = value;
            },
            validator: (value) {
              //if (value.isEmpty) {
              //return LOGIN_SCREEN_EMAIL_OR_LOGIN_REQUIRED;
              //}
              return null;
            },
          ),
        );
      }
      else {
        return Text(
          widget.task['comment'] != null
              ? widget.task['comment']
              : '',
        );
      }
    }
    else {
      return  Text(
        widget.task['comment'] != null
            ? widget.task['comment']
            : '',
      );
    }
  }

  Widget commentState(){
    return FutureBuilder<Widget>(
        future: getUserRole(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data;
          }
          else if (snapshot.hasError){
            return Text('error');
          }
          else {
            return SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            );
          }
        }
    );
  }
}