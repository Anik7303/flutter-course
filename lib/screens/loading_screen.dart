import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    print('LoadingScreen: calling initState');
    getLocationData();
  }

  void getLocationData() async {
    Location loc = Location();
    print('getting current location');
    await loc.getLocation();
    print('location fetched');

    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${loc.getLatitude()}&lon=${loc.getLongitude()}&APPID=509ec2ba32232c522b39134e8a18fc1e&units=metric';
    print('url: $url');
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(weather: weatherData),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    print('LoadingScreen: calling deactivate');
  }

  @override
  Widget build(BuildContext context) {
    print('LoadingScreen: calling build');
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
