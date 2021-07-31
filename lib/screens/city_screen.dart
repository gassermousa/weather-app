import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ), 
              Container(
                padding: EdgeInsets.all(50.0),
                child: TextField(
                  showCursor: true,
                  autocorrect: true,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration:txtfieldStyle,
                  onChanged: (value){
                    cityname=value;
                  },
                  
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context,cityname);

                    SpinKitDoubleBounce(
                      color: Colors.white,
                      size: 100.0,
                    );
                  
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
