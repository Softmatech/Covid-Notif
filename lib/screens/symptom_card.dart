import 'package:flutter/material.dart';
import 'package:flutter_practice/Utility/constants.dart';

class SymptomCard extends StatelessWidget {

  final String image;
  final String title;
  final bool isActive;

  const SymptomCard({
    Key key, this.image, this.title, this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            isActive
                ? BoxShadow(
                offset: Offset(0,10),
                blurRadius: 20,
                color: kSecondaryColor
            )
                : BoxShadow(
              offset: Offset(0,3),
              blurRadius: 6,
            )    ,
          ]
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90,width: 100,),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
