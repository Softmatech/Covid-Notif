import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/screens/appbase.dart';
import 'package:flutter_practice/screens/login_screen.dart';
import 'package:flutter_practice/screens/signup.dart';

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
      },
      title: 'NouKòd Flutter Practice',
      theme: ThemeData(
        scaffoldBackgroundColor:  Color.fromRGBO(55, 23, 65, 1),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline3: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontFamily: 'Spartan MB',
          )
        ),
      ),
      home: AppBase()
    );
  }
}


