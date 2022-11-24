import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Weather> fetchWeather() async {
  final response = await http
      .get(Uri.parse('http://dataservice.accuweather.com/currentconditions/v1/1065388?apikey=It2W4ACYxmplHBtjTIziBqOo3iejEWTO&language=es-mx&details=true'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}



class Weather {
  final double temperatureValue;
  final String temperatureUnit;

  final int humidity;

  final int windDirection;
  final double windSpeedValue;
  final String windSpeedUnit;

  final double pressureValue;
  final String pressureUnit;

  const Weather({
    required this.temperatureValue,
    required this.temperatureUnit,
    required this.humidity,
    required this.windDirection,
    required this.windSpeedValue,
    required this.windSpeedUnit,
    required this.pressureValue,
    required this.pressureUnit
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperatureValue: json['Temperature']['Metric']['Value'],
      temperatureUnit:  json['Temperature']['Metric']['Unit'],
      humidity:         json['RelativeHumidity'],
      windDirection:    json['Wind']['Direction']['Degrees'],
      windSpeedValue:   json['Temperature']['Metric']['Value'],
      windSpeedUnit:    json['Temperature']['Metric']['Unit'],
      pressureValue:    json['Pressure']['Metric']['Value'],
      pressureUnit:     json['Pressure']['Metric']['Unit'],
    );
  }
}


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Weather>(
            future: futureWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.temperatureUnit);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}