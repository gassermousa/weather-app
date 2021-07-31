import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';


class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});
  final locationweather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
      WeatherModel w=WeatherModel();
      var temp;
      String cityname;
      var cond;
      String weatherIcon;
      String txt;
  @override
  void initState() {
    
    super.initState();
    weatherinfo(widget.locationweather);
     print(widget.locationweather);
  }
  void weatherinfo(dynamic weather){
    setState(() {
      if(weather==null){
        temp=0;
        cityname='';
        weatherIcon='Error';
        txt='unable to get weather data';
        return;
      }
      else{

      temp=weather['main']['temp'] ;
     //temp=tempp.toInt();
     cityname=weather['name'];
     cond= weather['weather'][0]['id'];
     weatherIcon=w.getWeatherIcon(cond);
     txt=w.getMessage(temp);
      }
     print(temp);
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
                    onPressed: ()async {
                      var mydata=await w.getlocationWeather();
                      weatherinfo(mydata);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: ()async {
                      var typedName=await Navigator.push(context, MaterialPageRoute(
                      builder: (context){return CityScreen();}));
                      print(typedName);
                      if(typedName!=null){
                        var cityW=await w.getWeatherCity(typedName);
                        weatherinfo(cityW);
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$txt in $cityname",
                  textAlign: TextAlign.center,
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
