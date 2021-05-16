import 'package:diploma_v1/fake_data/position_requests.dart';

import 'package:flutter/material.dart';

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

  Widget body () {
    return Container(
        child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: requestsList.length,
            itemBuilder: (BuildContext context, int index){
              final invitation = requestsList[index];

              return buildInvitation(invitation);
            }
        )
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
