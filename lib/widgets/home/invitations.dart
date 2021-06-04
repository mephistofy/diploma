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
    return  ListView.builder(
        physics: ScrollPhysics(),
            padding: EdgeInsets.all(8),
            itemCount: invitationsList.length,
            itemBuilder: (BuildContext context, int index){
              final invitation = invitationsList[index];

              return buildInvitation(invitation, index);
            }

    );
  }

  List<Widget> buttons({margin: 0.0}){
    final children = [
      SizedBox(width: margin),

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
        width: 5.0,
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
      SizedBox(width: margin),
    ];
    return children;
  }

  Widget buildInvitation(invitation, index) {
    final width = MediaQuery.of(context).size.width;

    return width > 320.0
        ? ListTile(
            title: Text('Позиция: ' + invitation['position']),
            subtitle: Text('От кого: ' + invitation['invited_by_fullname']),
            trailing: Container(
              width: 110.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: buttons()
              )
            ),
          )
        : Container(
          decoration: BoxDecoration(
            //color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.black),
            boxShadow: [

            ],
          ),
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Column(
              children: [
          Container(
            margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'Позиция: ' + invitation['position'],
                style: TextStyle(
                  fontSize: 20.0,
                ),
              )
          ),

          SizedBox( height: 10.0),
          Container(
            child: Text(
              'От кого: ' + invitation['invited_by_fullname'],
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(height: 30.0,),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: buttons(margin: 40.0),
            ),
          ),
          SizedBox(height: 30.0,)
        ],
      ),
    );
  }
}
