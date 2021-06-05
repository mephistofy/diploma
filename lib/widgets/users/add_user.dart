import 'package:diploma_v1/fake_data/departments.dart';
import 'package:diploma_v1/fake_data/roles.dart';
import 'package:diploma_v1/helpers/button_styled.dart';
import 'package:flutter/material.dart';

/// Form widgets are stateful widgets
class PeopleAddForm extends StatefulWidget {
  PeopleAddForm({Key key}) : super(key: key);

  @override
  _PeopleAddFormState createState() => _PeopleAddFormState();
}

class _PeopleAddFormState extends State<PeopleAddForm> {
  final globalFormKey = GlobalKey<FormState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldState>();
  String departmentValue;
  List<bool> _isChecked;

  List<bool> getRoles(){
    List<bool> lst = [];
    for(var i = 0; i < ROLES_NAMES.length; ++i) {
      lst.add(false);
    }

    return lst;
  }

  void _handleUpdate(){

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    departmentValue = DEPARTMENTS_NAMES[0];
    _isChecked = getRoles();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
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
                          child: Text('Email: '),
                        ),

                        Flexible(
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),

                              ),
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              hintText: "Введите email...",
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

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text('ФИО: '),
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
                              hintText: "Введите Фамилию Имя Отчество...",
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

                    SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),

                        button_styled(
                          action: _handleUpdate,
                            child: Text('Создать сотрудника')
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