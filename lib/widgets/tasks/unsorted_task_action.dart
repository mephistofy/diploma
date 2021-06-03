import 'package:diploma_v1/fake_data/departments.dart';
import 'package:diploma_v1/helpers/popup_response_message.dart';
import 'package:diploma_v1/helpers/popup_width.dart';
import 'package:diploma_v1/helpers/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Form widgets are stateful widgets
class UnsortedTaskUpdateForm extends StatefulWidget {
  final unsortedTask;
  UnsortedTaskUpdateForm({Key key, this.unsortedTask}) : super(key: key);

  @override
  _UnsortedTaskUpdateFormState createState() => _UnsortedTaskUpdateFormState();
}

class _UnsortedTaskUpdateFormState extends State<UnsortedTaskUpdateForm> {
  final globalFormKey = GlobalKey<FormState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldState>();
  String departmentValue;

  var _url = 'https://vk.com/doc352392134_597187222?hash=336c48fd353cf6b090&dl=b068cf17ea0cb8bf7b';

  void _handleRedirect(context){
    redirect();
  }

  Future<void> redirect() async {
    return responsePopup(context, 'Successful!', true);
  }

  void _launchURL() async => await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    departmentValue = DEPARTMENTS_NAMES[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      width: getWidth(context),
      //color: Colors.red,
      child:
          Container(
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: globalFormKey,
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

                  Container(
                    height: 250.0,
                    child: SingleChildScrollView(
                      child: Text(
                        widget.unsortedTask['content'],
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.attachment),
                        onPressed: _launchURL,
                      ),

                      Text('Показать вложения'),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () => _handleRedirect(context),
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
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}