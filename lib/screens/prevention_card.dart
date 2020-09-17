import 'package:flutter/material.dart';
import 'package:flutter_practice/Utility/constants.dart';
import 'package:flutter_svg/svg.dart';

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
