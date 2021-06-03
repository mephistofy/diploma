
import 'package:flutter/cupertino.dart';

double getWidth(context){
  var width = MediaQuery.of(context).size.width;

  if ( width >= 1400){
    return 1100;
  }
  else {
    if (width < 1400 && width >= 1200 ) {
      return 900;
    }
    else {
      if (width >= 800) {
        return 700;
      }
      else {
        if (width < 800) {
          return 500;
        }
        else {
          return 400;
        }
      }
    }
  }

}