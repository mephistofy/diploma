import 'package:diploma_v1/constants/constants.dart';
import 'package:diploma_v1/helpers/avatar_hover.dart';
import 'package:diploma_v1/helpers/button_styled.dart';
import 'package:diploma_v1/helpers/hover_container.dart';
import 'package:diploma_v1/helpers/shared_prefs_helper.dart';
import 'package:diploma_v1/models/user.dart';
import 'package:diploma_v1/side_drawers/app_bar.dart';
import 'package:diploma_v1/side_drawers/side_drawers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:html' as html;

class MyAccountScreen extends StatefulWidget {
  MyAccountScreen ({Key key}) : super(key: key);

  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final globalFormKey = GlobalKey<FormState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldState>();
  var _password;
  var _password_confirmation;
  var _old_password;
  var file;
  bool fileChosen = false;
  var pickedImage;

  final _pickedImages = <Image>[];

  Future<void> _pickImage() async {
    Image fromPicker = await ImagePickerWeb.getImage(outputType: ImageType.widget);

    if (fromPicker != null) {
      setState(() {
        _pickedImages.clear();
        _pickedImages.add(fromPicker);
        print(_pickedImages);
        fileChosen = true;
      });
    }
  }

  Future<Widget> _body(context) async{
    final object = await CustomSharedPrefs.getObject("user");
    final user = User.fromJson(object);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
           Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,

             children: [
               Container(
                 width: 1000.0,
                 height: 350.0,
                 margin: EdgeInsets.only(left: 25.0, top: 35.0),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(20.0),
                   border: Border.all(color: Colors.black),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.5),
                       spreadRadius: 10,
                       blurRadius: 10,
                       offset: Offset(0, 3),
                     ),
                   ],
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,

                   children: [
                     Container(
                       padding: EdgeInsets.only(left: 50.0, right: 30.0, top: 50.0),
                       child: Row(
                         children: [
                           fileChosen ?
                           Container(
                             width: 200,
                             height: 200,
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               image: DecorationImage(
                                   image: _pickedImages[0].image,
                                   fit: BoxFit.fill
                               ),
                             ),
                           )
                               :
                           Container(
                             child: CircleAvatar(
                               radius: 100.0,
                               backgroundImage:
                               NetworkImage(user.avatar),
                               backgroundColor: Colors.transparent,
                             ),
                           ),

                           Container(
                             width: 700.0,
                             padding: EdgeInsets.only(left: 50.0),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,

                               mainAxisAlignment: MainAxisAlignment.spaceBetween,

                               children: [
                                 Container(
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                     children: [
                                       Container(
                                         child: Text(
                                           'ФИО',
                                           style: TextStyle(
                                             fontSize: 25.0,
                                           ),
                                         ),
                                       ),

                                       Container(
                                         width: 450.0,
                                         height: 40.0,
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
                                             hintText: user.fullname,
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
                                 ),

                                 Container(
                                   child:  Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Container(
                                         child: Text(
                                           'Email',
                                           style: TextStyle(
                                             fontSize: 25.0,
                                           ),
                                         ),
                                       ),

                                       Container(
                                         width: 450.0,
                                         height: 40.0,
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
                                             hintText: user.email,
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
                                 ),

                                 Container(
                                   margin: EdgeInsets.only(bottom: 10.0),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Container(
                                         child: Text(
                                           'Отдел',
                                           style: TextStyle(
                                             fontSize: 25.0,
                                           ),
                                         ),
                                       ),

                                       Container(
                                         child: Text(
                                           user.department != 'null' ? user.department : '',
                                           style: TextStyle(
                                             fontSize: 14.0,
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),

                                 Container(
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Container(
                                         child: Text(
                                           'Должности',
                                           style: TextStyle(
                                             fontSize: 25.0,
                                           ),
                                         ),
                                       ),

                                       Container(
                                         child: Text(
                                           user.roles.toString(),
                                           style: TextStyle(
                                             fontSize: 18.0,
                                           ),

                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               ),

               Container(
                 width: 1000.0,
                 height: 150.0,
                 margin: EdgeInsets.only(top: 25.0, left: 25.0),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(20.0),
                   border: Border.all(color: Colors.black),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.5),
                       spreadRadius: 10,
                       blurRadius: 10,
                       offset: Offset(0, 3),
                     ),
                   ],
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,

                   children: [
                     SizedBox(
                       width: 30.0,
                     ),

                     button_styled(
                       action: _pickImage,
                       child: Text('Выбрать Аватар'),
                     ),

                     button_styled(
                       child: Text('Обновить информацию '),
                     ),

                     SizedBox(
                       width: 30.0,
                     ),
                   ],
                 ),
               ),

               SizedBox(
                 height: 250.0,
               )
             ],
           ),

            Container(
              width: 670.0,
              height: 565.0,
              margin: EdgeInsets.only(top: 35.0, left: 25.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
                child: Center(
    child: Container(
      width: 400.0,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: globalFormKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      TextFormField(
                        key: Key("_username"),
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Новый пароль'),
                        keyboardType: TextInputType.text,
                        onSaved: (String value) {
                          _password = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return LOGIN_SCREEN_EMAIL_OR_LOGIN_REQUIRED;
                          }
                          return null;
                        },
                      ),

                      SizedBox(
                        height: 30.0,
                      ),

                      TextFormField(
                        decoration: InputDecoration(labelText: 'Подтверждение пароля'),
                        obscureText: true,
                        onSaved: (String value) {
                          _password_confirmation = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return LOGIN_SCREEN_PASSWORD_REQUIRED;
                          }
                          return null;
                        },
                      ),

                      SizedBox(
                        height: 30.0,
                      ),

                      TextFormField(
                        decoration: InputDecoration(labelText: 'Старый пароль'),
                        obscureText: true,
                        onSaved: (String value) {
                          _old_password = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return LOGIN_SCREEN_PASSWORD_REQUIRED;
                          }
                          return null;
                        },
                      ),

                      SizedBox(
                        height: 30.0,
                      ),

                      button_styled(
                        padding: EdgeInsets.only(left: 70.0),
                        innerPadding: EdgeInsets.only(left: 60.0, right: 60.0, top: 30.0, bottom: 30.0),
                        child: Text(
                          'Обновить пароль'
                        )
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    ),
    ),
            ),

        SizedBox(
          width: 10.0,
        )

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: SideDrawer(),
      appBar: customAppBar('Мой аккаунт', context),
      body: FutureBuilder<Widget>(
          future: _body(context), // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data;
            }
            else if (snapshot.hasError){
              return Text('error');
            }
            else {
              return SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              );
            }
          }
      )
    );
  }

}