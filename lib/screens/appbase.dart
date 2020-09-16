import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/Utility/constants.dart';

import 'login_screen.dart';
import 'signup.dart';

class AppBase extends StatefulWidget {
  @override
  _AppBaseState createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    _tabController = TabController(vsync: this, initialIndex: 1, length: 2);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: kFourthColor,
          labelColor: kFourthColor,
          unselectedLabelColor: Colors.white38,
          labelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
          tabs: <Widget>[
            Tab(
              text: "Signin",
            ),
            Tab(
              text: "Signup",
            ),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Login(title: 'Log In',),
         SignUp(title: "Sign Up",),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
    super.dispose();
  }
}
