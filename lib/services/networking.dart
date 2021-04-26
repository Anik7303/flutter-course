import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper({this.url});

  Future<dynamic> getData() async {
    Uri uri = Uri.parse(url);
    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
