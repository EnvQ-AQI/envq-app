import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherService {
  Future<List<String>> fetchWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.waqi.info/feed/here/?token=21a85442ff13ef918f154d4ce58eb70c288336eb'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Weather weather = Weather.fromJson(jsonDecode(response.body));

      List<String> castedParametersList = <String>[];

      castedParametersList.add(weather.pm25.toString());
      castedParametersList.add(weather.pm10.toString());
      castedParametersList.add(weather.ozone.toString());
      castedParametersList.add(weather.temperature.toString());
      castedParametersList.add(weather.pressure.toString());
      castedParametersList.add(weather.humidity.toString());
      castedParametersList.add(weather.wind.toString());
      castedParametersList.add(weather.aqi.toString());

      return castedParametersList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Error loading');
    }
  }
}
