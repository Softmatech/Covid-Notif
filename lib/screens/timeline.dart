import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/Services/networking.dart';
import 'package:flutter_practice/Utility/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'counter.dart';
import 'my_header.dart';
import 'package:intl/intl.dart';


class Timeline extends StatefulWidget {

  final countriesArray;
  final countriesMap;

  const Timeline({Key key,this.countriesMap, this.countriesArray}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {

  var infected = 0;
  var deaths = 0;
  var recovered = 0;
  var date_ = DateTime.now();
  String selectedCountry = "Haiti";
  List<String> countriesArray = [];
  var predictionDate;
  var predictionCase;
  bool isProgress = false;

  String getTagForCountry(String name){
        String tag = widget.countriesMap[name];
        return tag;
  }

  String formatDate(DateTime dateTime){
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(dateTime);
    print(formatted);
    return formatted;
  }

  Future<void> getCovidData(String country) async{
    var tag = await getTagForCountry(country);
    var networkHelper = NetworkHelper("https://covid19-api.org/api/status/$tag");
    var networkHelper_ = NetworkHelper("https://covid19-api.org/api/prediction/$tag");
    var data = await networkHelper.getDataFromApi();
    var data_ = await networkHelper.getDataFromApi();
    updateCovidData(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        child: Column(
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
                      value: selectedCountry,
                      items: widget.countriesArray
                    .map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                    value: value,
                  child:Text(value),
                    );
                  }).toList(),onChanged: (value){
                        setState(() {
                          selectedCountry = value;
                          isProgress = true;
                        });
                        getCovidData(value);
                    },),)
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
                            text: "Newest update for $selectedCountry on ${formatDate(date_)}",
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Counter(
                          number: infected,
                          color: Colors.orange,
                          title: "Infected",
                        ),
                        Counter(
                          number: deaths,
                          color: Colors.redAccent,
                          title: "Deaths",
                        ),
                        Counter(
                          number: recovered,
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
                        "Prediction for next week",
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
      inAsyncCall: isProgress,),
    );
  }

  updateCovidData(dynamic data){
    setState(() {
      infected = data["cases"];
      deaths = data["deaths"];
      recovered = data["recovered"];
      isProgress = false;
    });

  }

  updatePredictionData(dynamic data){
    setState(() {
      // predictionDate =
    });

  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
      getCovidData(selectedCountry);
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


