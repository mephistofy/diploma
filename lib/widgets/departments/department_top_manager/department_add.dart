import 'package:diploma_v1/fake_data/departments.dart';
import 'package:diploma_v1/fake_data/roles.dart';
import 'package:diploma_v1/helpers/button_styled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: width > 320.0 ? 200 : 550.0,
      width: width > 320.0 ? 800 : 1000.0,
      //color: Colors.red,
      child: ListView(
        children: <Widget>[
          Container(
            padding: width > 320 ? EdgeInsets.all(10.0) : EdgeInsets.only(top: 30.0),
            child: Form(
              key: globalFormKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    width > 320 ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                              'Название отдела: ',
                          ),
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
                    )
                    : Column(
                      children: [
                        Container(
                          child: Text(
                              'Название отдела: ',
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                        
                        SizedBox(height: 20.0),

                        Container(
                          child: Container(
                            width: 1000.0,
                            child: TextFormField(
                              maxLines: 10,
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
                      height: width > 320 ? 30.0 : 10.0,
                    ),

                    width > 320 ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),

                        button_styled(
                          action: _handleCreate,
                          child: Text('Создать')
                        ),
                      ],
                    )
                        : button_styled(
                      padding: EdgeInsets.only(left: 15.0, top: 0.0),
                        action: _handleCreate,
                        innerPadding: EdgeInsets.only(left: 100.0, right: 100.0),
                        child: Text('Создать')
                    ),
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