import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather.dart';

class WeatherService {
  Future<List<String>> fetchWeather() async {
    final waqiResponse = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=22.7375602&lon=-98.9576679&appid=e55e820a08be0a0163f6ebee18f15abb'));
    final aqairResponse = await http.get(Uri.parse(
        'http://api.airvisual.com/v2/nearest_city?lat=22.7476528&lon=-98.9630752&key=cc504fc1-7db3-422e-90cb-a3cc4d9aaca3'));

    if (waqiResponse.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Weather weather = Weather.fromJson(jsonDecode(waqiResponse.body), jsonDecode(aqairResponse.body));

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
