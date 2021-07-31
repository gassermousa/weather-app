import 'package:geolocator/geolocator.dart';
class Location{
  double lng;
  double lat;

Future<void> getlocation()async{
  try{
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  lat=position.latitude;
  lng=position.longitude;
  }
  catch(e){
    print(e);
  }
    
}
}