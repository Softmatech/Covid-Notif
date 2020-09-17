import 'package:flutter/material.dart';
import 'package:flutter_practice/Utility/constants.dart';
import 'package:flutter_practice/screens/my_header.dart';
import 'package:flutter_practice/screens/symptom_card.dart';
import 'package:flutter_svg/svg.dart';

class InfoScreen extends StatelessWidget {
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
}

class PreventionCard extends StatelessWidget {

  final String image;
  final String title;
  final String text;

  const PreventionCard({
    Key key, this.image, this.title, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,8),
                    blurRadius: 24,
                    color: kThirdColor
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 12,
                        color: kSecondaryColor
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

