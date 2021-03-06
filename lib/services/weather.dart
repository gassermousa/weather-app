import 'package:clima/services/networking.dart';

import 'package:clima/services/location.dart';
const  key='2e9084b4547387667aac62ad319401c0';

class WeatherModel {
 Future<dynamic>  getWeatherCity(String city)async{
    var url='https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$key&units=metric';
    Netwoekhelper netwoekhelper=Netwoekhelper(url);
     var weather=await netwoekhelper.getData();
     return weather;
  }


  Future<dynamic> getlocationWeather()async{
     Location loc=Location();
    await loc.getlocation();
    Netwoekhelper helper=Netwoekhelper('https://api.openweathermap.org/data/2.5/weather?lat=${loc.lat}&lon=${loc.lng}&appid=$key&units=metric');
    var weather=await helper.getData();
    return weather;
  }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
