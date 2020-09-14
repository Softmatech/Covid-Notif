import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Log In',
              style: Theme.of(context).textTheme.headline3,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.0, top: 20.0,bottom: 20.0, right: 50.0),
              child: Row(children: [
                Icon(
                    Icons.supervised_user_circle,
                    color: Colors.white,
                ),
                Expanded(child:
                TextField(
                  cursorColor: Colors.white70,
                  decoration: InputDecoration(
                      hintText: "Your User name please...",
                      hintStyle: TextStyle(
                        color: Colors.white70,
                      ),
                   ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))
              ],),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.0, top: 10.0,bottom: 20.0, right: 50.0),
              child: Row(children: [
                Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                Expanded(child:
                TextField(
                  obscureText: true,
                  cursorColor: Colors.white70,
                  decoration: InputDecoration(
                    hintText: "Your password please...",
                    hintStyle: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))
              ],),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 20.0),
              child: Text(
                'Password Forgoted!',
                style: TextStyle(
                  color: Colors.white,

                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: RaisedButton(
                onPressed: ()=>{
                  'yessss',
                },
                elevation: 10.0,
                color: Colors.white,
                child: Text(
                    'Sign in',
                  style: TextStyle(
                    color: Color.fromRGBO(55, 23, 65, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }
}