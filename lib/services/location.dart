import 'package:geolocator/geolocator.dart';

class Location{
  double startLatitude;
  double startLongitude;

  Future<void> getCurrentLocation() async{
    try{
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
      startLatitude=position.latitude;
      startLongitude=position.longitude;
    }
    catch(e){
      print(e);
    }
  }
}