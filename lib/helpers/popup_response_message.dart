
import 'package:flutter/material.dart';

Future<dynamic> responsePopup(context, msg, status){
  return  showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
            content:

               Container(
                //height: 150.0,
                width:  150.0,

                child: IconTheme(
                  data: IconThemeData(
                      color: Colors.green,
                      size: 80.0
                  ),
                  child: status ? Icon(Icons.done) : Icon(Icons.cancel),
                ),

              ),

          title: Center(
            child: Text(status ? 'Успешно' : 'Ошибка'),
          )
        );
      }
  );
}