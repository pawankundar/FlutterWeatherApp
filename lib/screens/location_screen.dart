import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.weatherdata);
  final weatherdata;
  
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  
  int cond;
  String city;
  int temp;
  String weathericon;
  String weathermessage;
  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateui(widget.weatherdata);

  }
void updateui(dynamic weatherdata){
  setState(() { 
    if (weatherdata == null){
      temp=0;
      weathericon ='error';
      weathermessage ='Unable to get the data';
      city ='';
      return;

    }
    var tempd = weatherdata['main']['temp'];
    temp = tempd.toInt();
    cond = weatherdata['weather'][0]['id'];
    city = weatherdata['name'];
    weathericon = weather.getWeatherIcon(cond);
    weathermessage = weather.getMessage(temp);
    
  }); 
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
                    onPressed: () async{
                      var weatherdata = await weather.getlocationData();
                      updateui(weatherdata);
                      print('updating');
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                 var typedname =   await Navigator.push(context, MaterialPageRoute(builder: (context){
                       return CityScreen();
                     }));
                     if(typedname != null){
                      var cityname = await weather.getcityweather(typedname);
                      updateui(cityname);
                     }
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
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weathericon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weathermessage in $city !' ,
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


  