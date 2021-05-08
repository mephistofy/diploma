import 'package:diploma_v1/helpers/shared_prefs_helper.dart';
import 'package:diploma_v1/helpers/show_snack_bar.dart';
import 'package:diploma_v1/models/api/api_error.dart';
import 'package:diploma_v1/models/user.dart';
import 'package:diploma_v1/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LogOut{
  static void _processPerform(context) async{
    final user = await CustomSharedPrefs.getObject("user");
    final _apiResponse = await Auth.logOut(User.fromJson(user).token);

    if ((_apiResponse.ApiError as ApiError) == null) {
      CustomSharedPrefs.removeObject("user");

      Modular.to.navigate('/login');
    }
    else {
      customShowSnackBar((_apiResponse.ApiError as ApiError).error, context);
    }
  }

  static Future<void> perform(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Вы уверены что хотите выйти ?'),

          actions: <Widget>[
            TextButton(
              child: Text('Да'),
              onPressed: () {
                _processPerform(context);
              },
            ),
            TextButton(
              child: Text('Нет'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}