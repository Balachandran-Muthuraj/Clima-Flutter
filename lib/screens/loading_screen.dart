import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetCurrentlocation();
    // Getdata();
  }


  void GetCurrentlocation() async {
    WeatherModel weatherModel = new WeatherModel();
   var Weatherdata= await weatherModel.GetlocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(WeatherData: Weatherdata);
    }));}

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: SpinKitCircle(
            color: Colors.white, size: 100,
          ),
        ),
      );
    }
  }

