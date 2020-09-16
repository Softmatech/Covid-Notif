import 'package:flutter/material.dart';
import 'package:flutter_practice/Utility/constants.dart';
import 'package:flutter_practice/screens/my_header.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyHeader(
            image: "assets/icons/medical_care.svg",
            text: "Want to know about Corona?",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Symptoms",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SymptomCard(image: "assets/images/headache.png",title: "Headache",),
                    SymptomCard(image: "assets/images/fever.png",title: "Fever",),
                    SymptomCard(image: "assets/images/caugh.png",title: "Caugh",),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
          BoxShadow(
            offset: Offset(0,10),
            blurRadius: 20,
            color: kSecondaryColor
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90,),
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
