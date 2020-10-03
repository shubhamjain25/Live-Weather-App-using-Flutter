import 'package:flutter/material.dart';
import 'package:live_climate_app/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async{
    WeatherModel weatherModel = WeatherModel();
    var weatherInfo=await weatherModel.getWeatherData();
    Navigator.push(context,MaterialPageRoute(builder:(context){
      return LocationScreen(weatherData: weatherInfo);
    }));
  }

  @override
  void initState(){
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          // TODO: Increase the time of widget to see what happens
          color: Colors.white,
          size: 50.0 ,
        ),
      ),
    );
  }
}


//      body: Center(
//        child: RaisedButton(
//          onPressed: () async{
//            getLocation();
//          },
//          child: Text('Get Location'),
//        ),
//      ),