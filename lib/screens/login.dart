import 'package:diploma_v1/helpers/shared_prefs_helper.dart';
import 'package:diploma_v1/helpers/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:async';

import 'package:diploma_v1/models/api/api_error.dart';
import 'package:diploma_v1/models/api/api_response.dart';
import 'package:diploma_v1/services/auth_service.dart';
import 'package:diploma_v1/models/user.dart';
import 'package:diploma_v1/constants/constants.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  ApiResponse _apiResponse;
  String _username;
  String _password;

  final globalFormKey = GlobalKey<FormState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldState>();

  void _saveAndRedirectToHome() {
    final user = User.fromJson(_apiResponse.Data);
    print(_apiResponse.Data);
    CustomSharedPrefs.setObject("user", user);

    Modular.to.navigate('/home');
  }

  void _showSnackBar(final String msg){
    if (mounted) {
      //customShowSnackBar(msg, context);
      final snackBar = SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 3),
        backgroundColor: Theme.of(context).primaryColor,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _handleSubmitted() async {
    final form = globalFormKey.currentState;
    final state = form.validate();

    if (state) {
      form.save();

      _showSnackBar(LOGIN_SCREEN_WAITING_FOR_ANSWER);

      _apiResponse = await Auth.login(_username, _password);

      if ((_apiResponse.ApiError as ApiError) == null) {
        Timer(Duration(seconds: 2), () {
          _showSnackBar(LOGIN_SCREEN_SUCCESSFUL_MSG);
        });

        _saveAndRedirectToHome();
      } else {
        _showSnackBar((_apiResponse.ApiError as ApiError).error);
      }

    } else {
      _showSnackBar(LOGIN_SCREEN_EMPTY_FIELDS);
    }
  }

  Widget _main(){
    return Scaffold(
      key: scaffoldMessengerKey,

      body: Center(
          child: Container(
              width:  448.0 ,
              height: 348.0,
              margin: EdgeInsets.all(20.0),

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),

              child: SafeArea(
                top: false,
                bottom: false,
                child: Form(
                  key: globalFormKey,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                key: Key("_username"),
                                decoration: InputDecoration(labelText: LOGIN_SCREEN_EMAIL_OR_LOGIN),
                                keyboardType: TextInputType.text,
                                onSaved: (String value) {
                                  _username = value;
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
                                decoration: InputDecoration(labelText: LOGIN_SCREEN_PASSWORD),
                                obscureText: true,
                                onSaved: (String value) {
                                  _password = value;
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return LOGIN_SCREEN_PASSWORD_REQUIRED;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10.0),

                              SizedBox(
                                height: 30.0,
                              ),

                              Center(
                                child: ElevatedButton(
                                    onPressed: _handleSubmitted,
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black),
                                ),

                              )
                ),

                                    child: Container(
                                      height: 50.0,
                                      width:  250.0,

                                      child: Center(
                                        child: Text(LOGIN_SCREEN_SIGN_IN),
                                      )
                                      ,
                                    ),
                                )

                              ),

                            ],
                          ),
                        ]),
                  ),
                ),
              ))
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _main();
  }
}