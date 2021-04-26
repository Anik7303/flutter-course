import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  static final String openWeatherBaseUrl =
      'https://api.openweathermap.org/data/2.5/weather';
  static final String _appID = '509ec2ba32232c522b39134e8a18fc1e';

  static Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getLocation();
    var lat = loc.getLatitude();
    var lon = loc.getLongitude();

    String url =
        '$openWeatherBaseUrl?lat=$lat&lon=$lon&APPID=$_appID&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url: url);
    return await networkHelper.getData();
  }

  static Future<dynamic> getCityWeather(String cityName) async {
    String url = '$openWeatherBaseUrl?q=$cityName&APPID=$_appID&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url: url);
    return await networkHelper.getData();
  }

  static String getWeatherIcon(int condition) {
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

  static String getMessage(int temp) {
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
