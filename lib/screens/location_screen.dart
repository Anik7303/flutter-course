import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final weather;

  LocationScreen({Key key, this.weather}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _cityName;
  int _temperature;
  String _weatherIcon;
  String _weatherMessage;

  @override
  void initState() {
    super.initState();

    print(widget.weather);
    updateUI(widget.weather);
  }

  void updateUI(dynamic data) {
    WeatherModel weather = WeatherModel();
    setState(() {
      var temp = data['main']['temp'];
      _cityName = data['name'];
      int condition = data['weather'][0]['id'];

      _temperature = temp.toInt();
      _weatherMessage = weather.getMessage(_temperature);
      _weatherIcon = weather.getWeatherIcon(condition);
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
                  TextButton(
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$_temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      _weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$_weatherMessage in $_cityName',
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

// _cityName = jsonData['name'];
// _conditionId = jsonData['weather'][0]['id'];
// _temperature = jsonData['main']['temp'];
