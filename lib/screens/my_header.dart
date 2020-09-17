import 'package:flutter/material.dart';
import 'package:flutter_practice/Utility/constants.dart';
import 'package:flutter_practice/Utility/my_clipper.dart';
import 'package:flutter_svg/svg.dart';

class MyHeader extends StatelessWidget {

  final String image;
  final String text;

  const MyHeader({
    Key key, this.image, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kFourthColor,
                  kFourthColor
                ]
            ),
            image: DecorationImage(
              alignment: Alignment.topRight,
              fit: BoxFit.scaleDown,
                image: AssetImage("assets/images/virus.png")
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset("assets/icons/menu.svg"),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Stack(
                children: <Widget>[
                  SvgPicture.asset(
                    image,
                    width: 230,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                    top: 160,
                    left: 0,
                    child: Text(
                      "$text",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
