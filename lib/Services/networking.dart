import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{

    final String url;
      NetworkHelper(this.url);

    Future getDataFromApi() async{
      http.Response response = await http.get(url);

      if(response.statusCode == 200) {
        String data = response.body;
        print(" 1--->> ${jsonDecode(data)}");
        return jsonDecode(data);
      }else{
        print("Error ${response.statusCode}");
      }
    }
}