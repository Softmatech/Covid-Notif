import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/Utility/constants.dart';
import 'package:flutter_practice/screens/my_header.dart';
import 'package:flutter_practice/screens/prevention_card.dart';
import 'package:flutter_practice/screens/symptom_card.dart';
import 'package:flutter_svg/svg.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      SymptomCard(image: "assets/images/headache.png",title: "Headache", isActive: true,),
                      SymptomCard(image: "assets/images/fever.png",title: "Fever",),
                      SymptomCard(image: "assets/images/caugh.png",title: "Caugh",),
                    ],
                  ),
                      SizedBox(height: 20,),
                      Text(
                        "Prevention",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 20,),
                      PreventionCard(image: "assets/images/wear_mask.png",
                        title: "Always wear your Mask !",
                        text: "It's esential for your own security !",
                      ),
                  PreventionCard(image: "assets/images/wash_hands.png",
                    title: "Wash your hands !",
                    text: "It's esential for your own security !",
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
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
    super.dispose();
  }
}


