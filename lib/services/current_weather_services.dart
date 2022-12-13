import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/historical.dart';
import '../models/weather.dart';

class WeatherService {
  Future<List<String>> fetchWeather() async {
    final waqiResponse = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=22.7375602&lon=-98.9576679&appid=eb60170e4251339b49df609df9641986'));
    final aqairResponse = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=22.7375602&lon=-98.9576679&appid=eb60170e4251339b49df609df9641986'));

    if (waqiResponse.statusCode == 200) {
      Weather weather = Weather.fromJson(jsonDecode(waqiResponse.body), jsonDecode(aqairResponse.body));

      List<String> castedParametersList = <String>[];

      castedParametersList.add("${weather.pm25} µg/m3");
      castedParametersList.add("${weather.pm10} µg/m3");
      castedParametersList.add("${weather.ozone} μg/m3");
      int celcius = (weather.temperature - 273.15).round();
      castedParametersList.add("$celcius °C");
      castedParametersList.add("${weather.pressure} mbar");
      castedParametersList.add(weather.humidity.toString());
      castedParametersList.add("${weather.wind} km/h");

      int aqi;
      double pm25 = weather.pm25;
      if(pm25 <= 12.0) {
        aqi = ((50 - 0) / (12.0 - 0.0) * (pm25 - 0.0) + 0).round();
      } else if (pm25 <= 35.4) {
        aqi = ((100 - 51) / (35.4 - 12.1) * (pm25 - 12.1) + 51).round();
      } else if (pm25 <= 55.4) {
        aqi = ((150 - 101) / (55.4 - 35.5) * (pm25 - 35.5) + 101).round();
      } else if (pm25 <= 150.4) {
        aqi = ((200 - 151) / (150.4 - 55.5) * (pm25 - 55.5) + 151).round();
      } else if (pm25 <= 250.4) {
        aqi = ((250 - 201) / (250.4 - 150.5) * (pm25 - 150.5) + 201).round();
      } else {
        aqi = ((300 - 251) / (500.4 - 250.5) * (pm25 - 250.5) + 251).round();
      }

      castedParametersList.add(aqi.toString());

      return castedParametersList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Error loading');
    }
  }
}
