import 'package:geolocator/geolocator.dart';

class Location{
  double Lattitude;
  double Longitude;
  
 Future <void> getLocation() async {
    try{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    
    Lattitude = position.latitude;
    Longitude = position.longitude;}
    catch (e){
      print(e);
    }
}
}