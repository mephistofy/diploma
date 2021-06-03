import 'package:diploma_v1/fake_data/position_requests.dart';
import 'package:diploma_v1/helpers/button_styled.dart';
import 'package:diploma_v1/helpers/hover_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RequestsScreen extends StatefulWidget {
  RequestsScreen({Key key}) : super(key: key);

  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  var requestsList;

  @override
  void initState() {
    super.initState();

    requestsList = POSITION_REQUEST_FAKE;
  }
  @override
  Widget build(BuildContext context) {
    return body();
  }

  _handleCreatePositionRequest(){}
  void _handleDialogCreateRequest(){
    createRequest(context);
  }

  Future<void> createRequest(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
            scrollable: true,
            title: Center(
              child: Text('Cоздание заявки на вступление в должность'),
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

                Text('fdsf'),
                //taskFilter(task),
              ],
            )
        );
      },
    );
  }

  Widget body () {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
       Row(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           button_styled(
             padding: EdgeInsets.all(20.0),
             child: Text('Создать запрос на вступление в должность')
           )
         ],
       ),

        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: requestsList.length,
                itemBuilder: (BuildContext context, int index){
                  final invitation = requestsList[index];
                  return buildInvitation(invitation);
                }
            )
        )

     ],
    );
  }

  Widget buildInvitation(var invitation) => ListTile(
    title: Text('Должность: ' + invitation['position']),
    subtitle: Text('Дата: ' + invitation['created_at'].toString()),
    trailing: Container(
      width: 200.0,
      child: invitation['status'] != null
          ? Container(
              child: Center(
                child: invitation['status'] == true
                    ? Text(
                        'Принято',
                         style: TextStyle(
                           fontSize: 15.0,
                           color: Colors.green,
                         ),
                      )
                    : Text(
                        'Отклонено',
                         style: TextStyle(
                           fontSize: 15.0,
                           color: Colors.red,
                         ),
                      ),
              ),
            )
          : Container(
              child: Center(
                child: Text(
                        'Рассматривается',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                ),
              ),
          )
    ),
  );
}
