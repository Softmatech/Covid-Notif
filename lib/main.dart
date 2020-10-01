import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/Utility/constants.dart';
import 'package:flutter_practice/screens/appbase.dart';
import 'package:flutter_practice/screens/info_screen.dart';
import 'package:flutter_practice/screens/login_screen.dart';
import 'package:flutter_practice/screens/signup.dart';
import 'package:flutter_practice/screens/WaitingScreen.dart';
import 'screens/timeline.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder> {
        '/Login': (BuildContext context) => Login(title: 'Log In',),
        '/SignUp': (BuildContext context) => SignUp(title: 'Sign Up',),
        '/Timeline': (BuildContext context) => Timeline(),
        '/Infoscreen': (BuildContext context) => InfoScreen(),
        '/Splashscreen': (BuildContext context) => WaitingScreen(),
      },
      title: 'NouKòd Flutter Practice',
      theme: ThemeData(
        scaffoldBackgroundColor:  kPrimaryColor,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline3: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontFamily: 'Spartan MB',
          ),
            headline4: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.normal,
              fontFamily: 'Spartan MB',
              fontSize: 20
            ),
            headline5: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontFamily: 'Spartan MB',
                fontSize: 17
            ),
            headline6: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.normal,
                fontFamily: 'Spartan MB',
                fontSize: 10
            )
        ),

      ),
      home: AppBase()
    );
  }
}


