import 'package:diploma_v1/fake_data/departments.dart';
import 'package:diploma_v1/fake_data/roles.dart';
import 'package:diploma_v1/helpers/button_styled.dart';
import 'package:flutter/material.dart';

/// Form widgets are stateful widgets
class RequestAddForm extends StatefulWidget {
  RequestAddForm({Key key}) : super(key: key);

  @override
  _RequestAddFormState createState() => _RequestAddFormState();
}

class _RequestAddFormState extends State<RequestAddForm> {
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