import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:diploma_v1/screens/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:page_transition/page_transition.dart';
import 'package:splashscreen/splashscreen.dart';

import 'login.dart';
import 'my_account.dart';

class CustomSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Image.network('https://play-lh.googleusercontent.com/4JhE7gxaHwlyK2BMEg_TvobZCEegsOvuJf9qclmpYnSIIV7iZrOn8w-lt8g0J4zgC08'),

        SizedBox(height: 10.0,),
        Center(
          child: Expanded(
            //width: 1500,
            child: TextLiquidFill(
                text: 'Добро пожаловать,' + ' John Cena',
                waveColor: Colors.black,
                boxBackgroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: MediaQuery.of(context).size.height/2.3,//MediaQuery.of(context).size.height,
              boxWidth: MediaQuery.of(context).size.width,
            ),
          ),
        )
      ],
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Welcome In SplashScreen Package"),
        automaticallyImplyLeading: false,
      ),
      body: new Center(
        child: new Text(
          "Succeeded!",
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
      ),
    );
  }
}