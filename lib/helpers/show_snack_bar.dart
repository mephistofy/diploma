import 'package:flutter/material.dart';

void customShowSnackBar(final String msg, context){
  final snackBar = SnackBar(
    content: Text(msg),
    duration: Duration(seconds: 3),
    backgroundColor: Theme.of(context).primaryColor,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}