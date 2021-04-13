import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:async';

import 'package:diploma_v1/models/api/api_error.dart';
import 'package:diploma_v1/models/api/api_response.dart';
import 'package:diploma_v1/services/auth_service.dart';
import 'package:diploma_v1/models/user.dart';


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

  GlobalKey<FormState>  globalFormKey = GlobalKey<FormState>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldState>();

  void _saveAndRedirectToHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userRole", (_apiResponse.Data as User).role);
    await prefs.setString("token", (_apiResponse.Data as User).token);
    
    Modular.to.navigate('/home');
  }

  void _handleSubmitted() async {
    final FormState form = globalFormKey.currentState;

    if (!form.validate()) {
      final snackBar = SnackBar(content: Text('Please, fulfill all of the fields'));

      scaffoldMessengerKey.currentState.showSnackBar(snackBar);
    } else {
      form.save();

      final snackBar = SnackBar(content: Text('waiting for answer...'));
      final Auth auth = new Auth();

      scaffoldMessengerKey.currentState.showSnackBar(snackBar);
      _apiResponse = await auth.login(_username, _password);

      print(_apiResponse.ApiError as ApiError == null);
      if ((_apiResponse.ApiError as ApiError) == null) {
        Timer(Duration(seconds: 2), () {
          final snackBar = SnackBar(content: Text('Succesful!'));

          scaffoldMessengerKey.currentState.showSnackBar(snackBar);

        });
        _saveAndRedirectToHome();

      } else {
        final snackBar = SnackBar(content: Text((_apiResponse.ApiError as ApiError).error));

        scaffoldMessengerKey.currentState.showSnackBar(snackBar);

      }
    }
  }

  Widget _main(){
    return Scaffold(
      key: scaffoldMessengerKey,

      body: Center(
          child: Container(
              width: 448.0,
              height: 348.0,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.red)

              ),
              child: SafeArea(
                top: false,
                bottom: false,
                child: Form(
                  autovalidate: true,
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
                              TextFormField(
                                key: Key("_username"),
                                decoration: InputDecoration(labelText: "Username/email"),
                                keyboardType: TextInputType.text,
                                onSaved: (String value) {
                                  _username = value;
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Username/email is required';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                decoration: InputDecoration(labelText: "Password"),
                                obscureText: true,
                                onSaved: (String value) {
                                  _password = value;
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Password is required';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10.0),
                              ButtonBar(
                                children: <Widget>[
                                  RaisedButton.icon(
                                      onPressed: _handleSubmitted,
                                      icon: Icon(Icons.arrow_forward),
                                      label: Text('Sign in')),
                                ],
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