import 'package:flutter/material.dart';
import 'package:flutter_practice/Utility/constants.dart';


class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text('Timeline'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      kFourthColor,
                      kPrimaryColor
                    ]
                ),
                image: DecorationImage(
                    image: AssetImage("assets/images/virus.png")
                )
            ),
          )
        ],

      ),
    );
  }
}

