import 'package:diploma_v1/fake_data/departments.dart';
import 'package:diploma_v1/fake_data/roles.dart';
import 'package:flutter/material.dart';

/// Form widgets are stateful widgets
class UnsortedTaskUpdateForm extends StatefulWidget {
  final unsortedTask;
  UnsortedTaskUpdateForm({Key key, this.unsortedTask}) : super(key: key);

  @override
  _DepartmentUpdateFormState createState() => _DepartmentUpdateFormState();
}

class _DepartmentUpdateFormState extends State<UnsortedTaskUpdateForm> {
  final globalFormKey = GlobalKey<FormState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldState>();
  String departmentValue;

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
    departmentValue = DEPARTMENTS_NAMES[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
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
                          child: Text(widget.unsortedTask['sender']),
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
                          child: Text(widget.unsortedTask['created_at'].toString()),
                        )
                      ],
                    ),

                    SizedBox(height: 50),

                    SingleChildScrollView(
                        child: Text(
                          widget.unsortedTask['content'],
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                    ),

                    SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: _delete,
                            child: Text('Направить в : ')
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