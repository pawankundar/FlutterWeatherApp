import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = 'd532a77f44ff0d93d5ebdfdfa9d20b69';

class WeatherModel {
  Future<dynamic> getcityweather(cityname)async{
    Netwworkhelper netwworkhelper =Netwworkhelper('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric');
    var citydata = await netwworkhelper.getData();
    return citydata;

  }
  
  Future <dynamic> getlocationData() async{
    Location location = Location();
    await location.getLocation();
  
    Netwworkhelper helper = Netwworkhelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.Lattitude}&lon=${location.Longitude}&appid=$apikey&units=metric');
    var weatherdata = await helper.getData();
    return weatherdata;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
