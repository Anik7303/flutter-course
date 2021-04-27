import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bitcoin_ticker/config/keys.dart';

class NetworkHelper {
  static String _baseUrl = 'https://rest.coinapi.io/v1/exchangerate';
  static String _appKey = Keys.APP_KEY;

  static Uri getUrl(String crypto, String currency) {
    String url = '$_baseUrl/$crypto/$currency?apikey=$_appKey';
    return Uri.parse(url);
  }

  static double parseRate(dynamic data) {
    return data['rate'];
  }

  static Future<double> getExchangeRate(String from, String to) async {
    try {
      Uri url = getUrl(from, to);
      http.Response res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        return parseRate(data);
      }

      print(res.statusCode);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
