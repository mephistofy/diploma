import 'package:diploma_v1/fake_data/departments.dart';
import 'package:diploma_v1/fake_data/roles.dart';
import 'package:flutter/material.dart';

/// Form widgets are stateful widgets
class DepartmentUpdateForm extends StatefulWidget {
  final department;
  DepartmentUpdateForm({Key key, this.department}) : super(key: key);

  @override
  _DepartmentUpdateFormState createState() => _DepartmentUpdateFormState();
}

class _DepartmentUpdateFormState extends State<DepartmentUpdateForm> {
  final globalFormKey = GlobalKey<FormState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldState>();

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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 800,
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
                          child: Text('Название отдела: '),
                        ),

                        Flexible(
                          child: Text(widget.department['name']),
                        )
                      ],
                    ),

                    SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Новое название отдела: '),
                        ),

                        Flexible(
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
                                  hintText: "Введите новое название...",
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
                        ),

                      ],
                    ),

                    SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Дата создание отдела: '),
                        ),
                        Flexible(
                          child: Text(widget.department['created_at'].toString()),
                        )
                      ],
                    ),

                    SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('Дата изменения отдела: '),
                        ),
                        Flexible(
                          child: Text(widget.department['updated_at'].toString()),
                        )
                      ],
                    ),

                    SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: _delete,
                            child: Text('Удалить отдел')
                        ),

                        ElevatedButton(
                            onPressed: _handleUpdate,
                            child: Text('Обновить отдел')
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