import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget button_styled(
    {
      padding: const EdgeInsets.all(0.0),
      innerPadding: const EdgeInsets.all(20.0),
      backgroudColor: Colors.black,
      borderRadius: 15.0,
      child: const Text('Test button text'),
      action: null,
      param: null,
    }
    )
{
  return Padding(
    padding: padding,
    child: ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(innerPadding),
        backgroundColor: MaterialStateProperty.all(backgroudColor),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused))
                return Colors.red;
              if (states.contains(MaterialState.hovered))
                return Colors.blue;
              if (states.contains(MaterialState.pressed))
                return Colors.black;
              return null; // Defer to the widget's default.
            }),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))),

      ),
      onPressed: () => param == null ? action () : action(param),
      child: child,
    ),
  );
}