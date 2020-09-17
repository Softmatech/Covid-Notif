import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/Services/networking.dart';
import 'package:flutter_practice/Utility/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'counter.dart';
import 'my_header.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {

  var infected ;
  var deaths ;
  var recovered;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyHeader(image: "assets/icons/social_distancing.svg",text: "Please wear a mask, Stay at Home !",),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Color(0XFFE5E5E5),
              ),
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                SizedBox(width: 20,),
                Expanded(
                  child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                    value: "Haiti",
                    items: ["Haiti","Dominican Republic","USA","Canada","Chile","Brazil"]
                  .map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                  value: value,
                child:Text(value),
                  );
                }).toList(),onChanged: (value){},),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Case Update\n",
                          style: Theme.of(context).textTheme.headline5
                        ),
                        TextSpan(
                          text: "Newest update September 16",
                          style: Theme.of(context).textTheme.headline6
                        ),
                      ]
                    ),
                  ),
                    Spacer(),
                    Text(
                      "See Details",
                      style: TextStyle(
                        color: kFourthColor,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0,4),
                        color: kThirdColor
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Counter(
                        number: infected,
                        color: Colors.orange,
                        title: "Infected",
                      ),
                      Counter(
                        number: 123,
                        color: Colors.redAccent,
                        title: "Deaths",
                      ),
                      Counter(
                        number: 4210,
                        color: Colors.green,
                        title: "Recovered",
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Spread of the Virus",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      "See Details",
                      style: TextStyle(
                        color: kFourthColor,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 7),
                  padding: EdgeInsets.all(10),
                  height: 178,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0,10),
                        blurRadius: 30,
                        color: kThirdColor
                      ),
                    ]
                  ),
                  child: Image.asset("assets/images/map.png", fit: BoxFit.scaleDown,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    var data = NetworkHelper("https://covid19-api.org/api/timeline/HT");
    print("data---->> $data");

    // infected = data[0]["cases"];
    // deaths = jsonDecode(data)[0]["deaths"];
    // recovered = jsonDecode(data)[0]["recovered"];
    print(infected);
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


