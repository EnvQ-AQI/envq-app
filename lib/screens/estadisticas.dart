import 'dart:ui';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:bases_flutter/provider/est.dart';

Future<Weather> fetchWeather() async {
  final response = await http.get(Uri.parse(
      'http://dataservice.accuweather.com/currentconditions/v1/1065388?apikey=It2W4ACYxmplHBtjTIziBqOo3iejEWTO&language=es-mx&details=true'));

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

class EstadisticasScreen extends StatefulWidget {
  const EstadisticasScreen({Key? key}) : super(key: key);

  @override
  State<EstadisticasScreen> createState() => EstadisticasScreenState();
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
    required this.pressureUnit,
  });

  factory Weather.fromJson(List<dynamic> json) {
    return Weather(
      temperatureValue: json[0]['Temperature']['Metric']['Value'],
      temperatureUnit: json[0]['Temperature']['Metric']['Unit'],
      humidity: json[0]['RelativeHumidity'],
      windDirection: json[0]['Wind']['Direction']['Degrees'],
      windSpeedValue: json[0]['Wind']['Speed']['Metric']['Value'],
      windSpeedUnit: json[0]['Wind']['Speed']['Metric']['Unit'],
      pressureValue: json[0]['Pressure']['Metric']['Value'],
      pressureUnit: json[0]['Pressure']['Metric']['Unit'],
    );
  }
}

class EstadisticasScreenState extends State<EstadisticasScreen> {
  late Future<Weather> currentWeather;

  @override
  void initState() {
    super.initState();
    currentWeather = fetchWeather();
  }

  Widget build(BuildContext context) {
    int rango = 99;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    List<String> info = [
      "PM 2.5",
      "PM 10",
      "Ozono (03)",
      "Temperatura",
      "Presión",
      "Humedad",
      "Vientos"
    ];

    final tam = MediaQuery.of(context).size;

    final c = Provider.of<Est>(context, listen: false);

    c.tipoColor(rango);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("ENVQ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),centerTitle: true,flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFBCB616), Color(0xFFFEC56B)])),)),
          body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: tam.height * 0.015),
              width: double.infinity,
              height: tam.height * 0.45,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: c.color == null
                          ? <Color>[Color(0xFF12B04e), Color(0xFFCBE145)]
                          : c.color,
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "El Mante, Tamaulipas, México",
                        style: TextStyle(color: Colors.white, fontSize: tam.width*0.0335),
                      ),
                      IconButton(
                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2222)
                            );
                          },
                          icon: Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.white,
                            size: tam.height * 0.055,
                          ))
                          
                    ],
                  ),
                  SizedBox(
                    height: tam.height * 0.018,
                  ),
                  Text("10 de septiembre de 2022",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: tam.height * 0.020,
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: tam.width * 0.31),
                    child: Row(
                      children: [
                        Text(
                          "99",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: tam.height * 0.15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: tam.height * 0.01,
                        ),
                        SizedBox(
                            height: tam.height * 0.12,
                            width: tam.width * 0.17,
                            child: const Image(
                              image: AssetImage("assets/Viento.jpg"),
                              fit: BoxFit.fill,
                            ))
                      ],
                    ),
                  ),
                  Text(
                    "Moderado",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: tam.height * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Puedes salir con precaución",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: tam.height * 0.020,
                    ),
                  ),
                  Text(
                    "Temperatura: 27°C",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: tam.height * 0.020,
                    ),
                  ),
                  SizedBox(
                    height: tam.height * 0.020,
                  ),
                ],
              )),
          SizedBox(
            height: tam.height * 0.040,
          ),
          for (int i = 0; i < 5; i++)
            GestureDetector(onTap: () {
              Navigator.pushNamed(context, "Graficas");
            },
            Padding(
              padding: EdgeInsets.symmetric(horizontal: tam.width * 0.080),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FutureBuilder<Weather>(
                          future: currentWeather,
                          builder: (context, snapshot) {
                            if(snapshot.data!=null){ 
                               List<String> infodd = [
                              "temperature                                                           "+(snapshot.data!.temperatureValue.toString()+" "+(snapshot.data!.temperatureUnit)),
                              
                              "humidity                                                                     "+(snapshot.data!.humidity.toString())+" %",
                             "windDirection                                                              "+ (snapshot.data!.windDirection.toString()),
                               "windSpeed                                                     "+ (snapshot.data!.windSpeedValue.toString())+" "+  (snapshot.data!.windSpeedUnit),
                               
                                "pressure                                                       "+(snapshot.data!.pressureValue.toString())+" "+(snapshot.data!.pressureUnit.toString()),
                                  
                            ];

                            if (snapshot.hasData) {
                              print(infodd[i]);
                              return Text(infodd[i],
                          style: TextStyle(fontWeight: FontWeight.bold));
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }

                            }
                            
                            return const Text('--');
                          })
                    ],
                  ),
                  Divider(
                    height: tam.height * 0.030,
                    color: Colors.black,
                  )
                ],
              ),
            )
            
        ],
      )),
      
    );
    
  }
}
