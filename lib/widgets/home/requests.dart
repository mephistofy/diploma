import 'package:diploma_v1/fake_data/position_requests.dart';
import 'package:diploma_v1/helpers/button_styled.dart';
import 'package:diploma_v1/helpers/hover_container.dart';
import 'package:diploma_v1/widgets/home/request_add.dart';

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
    final width = MediaQuery.of(context).size.width;
    final mobile = 11.0;
    final web = 14.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Row(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           button_styled(
             padding: EdgeInsets.all(20.0),
             child: Text(
                 'Создать запрос на вступление в должность',
               style: TextStyle(
                 fontSize: width > 320 ? web : mobile,
               ),
             ),
             action: performAddRequest
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

  void performAddRequest(){
    requestAdd(context);
  }
  Future<void> requestAdd(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            scrollable: true,
            title: Center(
              child: Text('Запрос на вступление в должность'),
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

                RequestAddForm(),
              ],
            )
        );
      },
    );
  }

  Widget buildInvitation(var invitation) {
    final width = MediaQuery.of(context).size.width;

    return ListTile(
      title: Text(
          'Должность: ' + '\n' + invitation['position'],
        style: TextStyle(
          fontSize: width > 320 ? 15.0 : 14.0,
        ),
      ),
      subtitle: Text(
          'Дата: ' + '\n' + invitation['created_at'].toString(),
        style: TextStyle(
          fontSize: width > 320 ? 15.0 : 13.0,
        ),
      ),
      trailing: Container(
          width: width <= 320.0 ? 100.0 : 150.0,
          child: invitation['status'] != null
              ? Container(
            child: Center(
              child: invitation['status'] == true
                  ? Text(
                'Принято',
                style: TextStyle(
                  fontSize: width > 320 ? 15.0 : 12.0,
                  color: Colors.green,
                ),
              )
                  : Text(
                'Отклонено',
                style: TextStyle(
                  fontSize: width > 320 ? 15.0 : 12.0,
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
                  fontSize: width > 320 ? 15.0 : 12.0,
                  color: Colors.grey,
                ),
              ),
            ),
          )
      ),
    );
  }
}
