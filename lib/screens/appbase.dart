import 'package:flutter/material.dart';

/// This Widget is the main application widget.
class AppBase extends StatefulWidget {

  AppBase({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppBaseState createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Base',
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
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text('Sign In'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            title: Text('Sign Up'),
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(55, 23, 65, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
