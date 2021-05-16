import 'package:diploma_v1/fake_data/invitations.dart';
import 'package:flutter/material.dart';

class InvitationsScreen extends StatefulWidget {
  InvitationsScreen({Key key}) : super(key: key);

  @override
  _InvitationsScreenState createState() => _InvitationsScreenState();
}

class _InvitationsScreenState extends State<InvitationsScreen> {
  String query = '';
  var invitationsList;

  @override
  void initState() {
    super.initState();

    invitationsList = INVITATIONS_FAKE;
  }
  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body (){
    //print(peopleList[0]['avatar']);

    return Container(
        child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: invitationsList.length,
            itemBuilder: (BuildContext context, int index){
              final invitation = invitationsList[index];

              return buildInvitation(invitation);
            }
        )
    );
  }

  Widget buildInvitation(var invitation) => ListTile(
      title: Text('От кого: ' + invitation['invited_by_fullname']),
      subtitle: Text('Позиция: ' + invitation['position']),
      trailing: Container(
        width: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.green,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.done),
                color: Colors.white,
                onPressed: () {},
              ),
            ),

            SizedBox(
              width: 20.0,
            ),

            Ink(
              decoration: const ShapeDecoration(
                color: Colors.red,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.cancel),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),

    //Text('Дата приглашения: ' + invitation['created_at'].toString()),
  );
}
