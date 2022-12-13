import 'dart:convert';
import 'package:bases_flutter/models/pollutants.dart';
import 'package:bases_flutter/models/weather_components.dart';
import 'package:http/http.dart' as http;
import '../models/historical.dart';
import '../models/weather.dart';

class HistoricalService {
  Future<List<List<Map<String, dynamic>>>> fetchHistory() async {
    String uriPoll = 'https://api.openweathermap.org/data/2.5/air_pollution/history?lat=22.7375602&lon=-98.9576679&start=1670306400&end=1670738400&appid=eb60170e4251339b49df609df9641986';
    String uriWeather = 'https://history.openweathermap.org/data/2.5/history/city?lat=22.7375602&lon=-98.9576679&type=hour&start=1670306400&end=1670738400&appid=eb60170e4251339b49df609df9641986';

    final poll = await http.get(Uri.parse(uriPoll));
    final weather = await http.get(Uri.parse(uriWeather));

    if (poll.statusCode == 200 && weather.statusCode == 200) {
      Historical history = Historical.fromJson(jsonDecode(poll.body), jsonDecode(weather.body));

      List<List<Map<String, dynamic>>> castedParametersList = [];

      castedParametersList.add([]);
      castedParametersList.add([]);
      castedParametersList.add([]);
      castedParametersList.add([]);
      castedParametersList.add([]);
      castedParametersList.add([]);
      castedParametersList.add([]);

      double pm25 = 0.0;
      double pm10 = 0.0;
      double ozone = 0.0;
      double temperature = 0.0;
      int pressure = 0;
      int humidity = 0;
      double wind = 0.0;

      for(int i = 0; i < history.pollutants.length && i < history.weather.length; i++) {
        if(i > 0 && i % 24 == 0) {
          castedParametersList[0].add({'domain': '${(i / 24).round()}', 'measure': pm25 / 24});
          castedParametersList[1].add({'domain': '${(i / 24).round()}', 'measure': pm10 / 24});
          castedParametersList[2].add({'domain': '${(i / 24).round()}', 'measure': ozone / 24});
          castedParametersList[3].add({'domain': '${(i / 24).round()}', 'measure': ((temperature / 24) - 273.15).round() });
          castedParametersList[4].add({'domain': '${(i / 24).round()}', 'measure': pressure / 24});
          castedParametersList[5].add({'domain': '${(i / 24).round()}', 'measure': humidity / 24});
          castedParametersList[6].add({'domain': '${(i / 24).round()}', 'measure': wind / 24});

          pm25 = 0.0;
          pm10 = 0.0;
          ozone = 0.0;
          temperature = 0.0;
          pressure = 0;
          humidity = 0;
          wind = 0.0;
        }

        Pollutants polls = Pollutants.fromJson(history.pollutants[i]);
        WeatherComponents components = WeatherComponents.fromJson(history.weather[i]);

        pm25  += polls.pm25;
        pm10  += polls.pm10;
        ozone += polls.ozone;
        temperature += components.temperature;
        pressure    += components.pressure;
        humidity    += components.humidity;
        wind        += components.wind;
      }

      return castedParametersList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Error loading');
    }
  }

  Future<List<List<Map<String, dynamic>>>> fetchHistoryRange(int start, int end) async {
    String uriPoll = 'https://api.openweathermap.org/data/2.5/air_pollution/history?lat=22.7375602&lon=-98.9576679&start=$start&end=$end&appid=eb60170e4251339b49df609df9641986';
    String uriWeather = 'https://history.openweathermap.org/data/2.5/history/city?lat=22.7375602&lon=-98.9576679&type=hour&start=$start&end=$end&appid=eb60170e4251339b49df609df9641986';

    final poll = await http.get(Uri.parse(uriPoll));
    final weather = await http.get(Uri.parse(uriWeather));

    if (poll.statusCode == 200 && weather.statusCode == 200) {
      Historical history = Historical.fromJson(jsonDecode(poll.body), jsonDecode(weather.body));

      List<List<Map<String, dynamic>>> castedParametersList = [];

      castedParametersList.add([]);
      castedParametersList.add([]);
      castedParametersList.add([]);
      castedParametersList.add([]);
      castedParametersList.add([]);
      castedParametersList.add([]);
      castedParametersList.add([]);

      double pm25 = 0.0;
      double pm10 = 0.0;
      double ozone = 0.0;
      double temperature = 0.0;
      int pressure = 0;
      int humidity = 0;
      double wind = 0.0;

      for(int i = 0; i < history.pollutants.length && i < history.weather.length; i++) {
        if(i > 0 && i % 24 == 0) {
          castedParametersList[0].add({'domain': '${(i / 24).round()}', 'measure': pm25 / 24});
          castedParametersList[1].add({'domain': '${(i / 24).round()}', 'measure': pm10 / 24});
          castedParametersList[2].add({'domain': '${(i / 24).round()}', 'measure': ozone / 24});
          castedParametersList[3].add({'domain': '${(i / 24).round()}', 'measure': ((temperature / 24) - 273.15).round() });
          castedParametersList[4].add({'domain': '${(i / 24).round()}', 'measure': pressure / 24});
          castedParametersList[5].add({'domain': '${(i / 24).round()}', 'measure': humidity / 24});
          castedParametersList[6].add({'domain': '${(i / 24).round()}', 'measure': wind / 24});

          pm25 = 0.0;
          pm10 = 0.0;
          ozone = 0.0;
          temperature = 0.0;
          pressure = 0;
          humidity = 0;
          wind = 0.0;
        }

        Pollutants polls = Pollutants.fromJson(history.pollutants[i]);
        WeatherComponents components = WeatherComponents.fromJson(history.weather[i]);

        pm25  += polls.pm25;
        pm10  += polls.pm10;
        ozone += polls.ozone;
        temperature += components.temperature;
        pressure    += components.pressure;
        humidity    += components.humidity;
        wind        += components.wind;
      }

      return castedParametersList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Error loading');
    }
  }
}
