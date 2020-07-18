import 'dart:convert';

import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final WeatherData;

  LocationScreen({this.WeatherData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temperature;
  int Weather;
  String Cityname;
  String weathericon;
  String Message;
  WeatherModel weatherModel=new WeatherModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('location screen');
    print(widget.WeatherData);
    UpdateUI(widget.WeatherData);


  }
  void UpdateUI( dynamic weatherdatasource)
  {
    try {
     if(weatherdatasource!=null) {
       temperature = weatherdatasource['main']['temp'];
       Weather = weatherdatasource['weather'][0]['id'];
       Cityname = weatherdatasource['name'];
       weathericon = weatherModel.getWeatherIcon(Weather);
       Message = weatherModel.getMessage(Weather);
     }else
       {
         temperature = 0;
         Weather = 0;
         Cityname = 'Error';
         weathericon = '';
         Message = 'Error on getting Weather';
       }
    }
    catch(exception)
    {
      print(exception);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        var Weatherdata= weatherModel.GetlocationWeather();
                        UpdateUI(Weatherdata);
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 40.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weathericon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$Message $Cityname!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
