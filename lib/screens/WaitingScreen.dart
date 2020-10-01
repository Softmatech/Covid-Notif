import 'package:flutter/material.dart';
import 'package:flutter_practice/Services/networking.dart';
import 'package:flutter_practice/screens/timeline.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WaitingScreen extends StatefulWidget {
  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async{
    var networkHelper = NetworkHelper("https://covid19-api.org/api/status/HT");
    var data = await networkHelper.getDataFromApi();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Timeline(coronaData: data,);
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
