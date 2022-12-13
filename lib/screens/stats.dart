import 'package:bases_flutter/models/historical.dart';
import 'package:bases_flutter/provider/color_provider.dart';
import 'package:bases_flutter/provider/current_weather_provider.dart';
import 'package:bases_flutter/provider/historical_weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:d_chart/d_chart.dart';

import '../provider/date_manager_provider.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => StatsScreenState();
}

class StatsScreenState extends State<StatsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedDateTime = Provider.of<DateManagerProvider>(context, listen: false);
    final weather = Provider.of<CurrentWeatherProvider>(context, listen: false);
    final history = Provider.of<HistoricalWeatherProvider>(context, listen: false);
    final aqiRange = Provider.of<ColorModel>(context, listen: false);

    int range = 52;
    aqiRange.tipoColor(52);

    weather.getWeatherData();
    history.getWeatherData();

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

    // Widgets
    // Graphic widget

    Container aqiContainer() {
        return Container(
              padding: EdgeInsets.only(top: tam.height * 0.015),
              width: double.infinity,
              height: tam.height * 0.45,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: aqiRange.color,
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
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                locale: const Locale("es", "MX"),
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now().subtract(const Duration(days: 30)),
                                lastDate: DateTime.now())as DateTime;
                            if (pickedDate != null) {
                              selectedDateTime.setDate(pickedDate);
                              history.getWeatherDataRange(
                                  (pickedDate.subtract(const Duration(days: 7)).millisecondsSinceEpoch / 1000).round(),
                                  (pickedDate.millisecondsSinceEpoch / 1000).round());
                            } else {}
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
                  Consumer<DateManagerProvider>(builder: (context, date, child) {
                    return Text(date.formattedDateTime(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: tam.height * 0.020,
                        )
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Consumer<CurrentWeatherProvider>(
                          builder: (context, value, child) {
                            if (value.isLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final data = value.weather;
                            range = int.parse(data[7]);
                            aqiRange.tipoColor(range);
                            return Text(
                              data[7],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: tam.height * 0.15,
                                  fontWeight: FontWeight.bold),
                            );
                          }),
                      SizedBox(
                        width: tam.height * 0.01,
                      ),
                    ],
                  ),
                  Text(
                    aqiRange.currentState,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: tam.height * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    aqiRange.message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: tam.height * 0.020,
                    ),
                  ),
                  SizedBox(
                    height: tam.height * 0.020,
                  ),
                ],
              ));
    }

    DChartBar chart(List<Map<String, dynamic>> data) {
            return DChartBar(
                data: [
                  {
                    'id': 'Bar',
                    'data': data,
                  },
                ],
                domainLabelPaddingToAxisLine: 16,
                axisLineTick: 2,
                axisLinePointTick: 2,
                axisLinePointWidth: 8,
                axisLineColor: Colors.green,
                measureLabelPaddingToAxisLine: 16,
                barColor: (barData, index, id) => Colors.green,
              );
    }

    // Fin Widgets

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              aqiContainer(),
              SizedBox(
                height: tam.height * 0.040,
              ),
              for (int i = 0; i < 7; i++)
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("${info[i]} de los ultimos 7 dias"),
                            content: AspectRatio(
                              aspectRatio: 16 / 9,
                              child:
                              Consumer<HistoricalWeatherProvider>(
                                builder: (context, value, child) {
                                  if (value.isLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  final data = value.history;
                                  return chart(data[i]);
                                },
                              ),
                            ),
                          )
                      );
                      // Navigator.pushNamed(context, "Graficas");
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
                              Consumer<CurrentWeatherProvider>(
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
                          Divider (
                            height: tam.height * 0.030,
                            color: Colors.black,
                          )
                        ],
                      ),
                    )
                )
            ],
          )
      ),
    );

  }
}
