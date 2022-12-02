import 'package:bases_flutter/provider/color_provider.dart';
import 'package:bases_flutter/provider/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => StatsScreenState();
}

class StatsScreenState extends State<StatsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<WeatherProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
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

    final c = Provider.of<ColorModel>(context, listen: false);

    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: tam.height * 0.015),
              width: double.infinity,
              height: tam.height * 0.45,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: c.color ??
                          <Color>[
                            const Color(0xFF12B04e),
                            const Color(0xFFCBE145)
                          ],
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
                        style: TextStyle(
                            color: Colors.white, fontSize: tam.width * 0.0335),
                      ),
                      IconButton(
                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2222));
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
                        Consumer<WeatherProvider>(builder: (context, value, child) {
                          if (value.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final data = value.weather;
                          rango = int.parse(data[7]);
                          c.tipoColor(rango);
                          return Text(data[7],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: tam.height * 0.15,
                                fontWeight: FontWeight.bold),
                          );
                        }),
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
                    c.currentState,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: tam.height * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    c.message,
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
          for (int i = 0; i < 7; i++)
            GestureDetector(
                onTap: () {
                  rango = 51;
                  Navigator.pushNamed(context, "Graficas");
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: tam.width * 0.080),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(info[i],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Consumer<WeatherProvider>(
                            builder: (context, value, child) {
                              if (value.isLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final data = value.weather;
                              return Text(data[i],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold));
                            },
                          ),
                        ],
                      ),
                      Divider(
                        height: tam.height * 0.030,
                        color: Colors.black,
                      )
                    ],
                  ),
                ))
        ],
      )),
    );
  }
}
