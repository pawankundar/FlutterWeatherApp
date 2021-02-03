import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';





class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
    
  }
  void getLocationData()async{ 
    WeatherModel weathermodel =WeatherModel();
    var weatherdata = await weathermodel.getlocationData();
   
    Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen(weatherdata);
    }));

  
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SpinKitCircle(
       color: Colors.white,
       size:  100,
     ) ,
    );
  }
}
