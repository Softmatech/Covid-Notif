import 'package:flutter/material.dart';
import 'package:flutter_practice/Services/networking.dart';
import 'package:flutter_practice/screens/timeline.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WaitingScreen extends StatefulWidget {
  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {

  var countriesMap = new Map();
  List<String> countriesArray = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async{
    var networkHelper = NetworkHelper("https://covid19-api.org/api/status/HT");
    var data = await networkHelper.getDataFromApi();

    var networkHelper_ = NetworkHelper("https://covid19-api.org/api/countries");
    var data_ = await networkHelper_.getDataFromApi();
    for (var country in data_ ){
      countriesMap[country["name"]] = country["alpha2"];
      countriesArray.add(country["name"]);
    }
    print(countriesArray);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Timeline(countriesArray: countriesArray, coronaData: data,);
    },));
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }

}
