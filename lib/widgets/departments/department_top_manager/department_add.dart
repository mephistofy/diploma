import 'package:diploma_v1/fake_data/departments.dart';
import 'package:diploma_v1/fake_data/roles.dart';
import 'package:flutter/material.dart';

/// Form widgets are stateful widgets
class DepartmentAddForm extends StatefulWidget {
  DepartmentAddForm({Key key}) : super(key: key);

  @override
  _DepartmentAddFormState createState() => _DepartmentAddFormState();
}

class _DepartmentAddFormState extends State<DepartmentAddForm> {
  final globalFormKey = GlobalKey<FormState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldState>();

  void _handleCreate(){

  }

  void _delete(){
    _handleCreate();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
                          child: Container(
                            width: 1000.0,
                            child: TextFormField(
                              maxLines: 4,
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
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 30.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),

                        ElevatedButton(
                            //onPressed: _handleUpdate,
                            child: Text('Создать')
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