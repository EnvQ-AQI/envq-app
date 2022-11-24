import 'dart:math';

import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class Graficas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final datos = ["200", "150", "100", "50", "0"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(1),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartBar(
                    data: [
                      {
                        'id': 'Bar',
                        'data': [
                          {'domain': '0', 'measure': 98},
                          {'domain': '1', 'measure': 140},
                          {'domain': '2', 'measure': 135},
                          {'domain': '3', 'measure': 10},
                          {'domain': '4', 'measure': 25},
                          {'domain': '5', 'measure': 108},
                          {'domain': '6', 'measure': 5},
                          {'domain': '7', 'measure': 70},
                          {'domain': '8', 'measure': 50},
                          {'domain': '9', 'measure': 106},
                          {'domain': '10', 'measure': 104},
                          {'domain': '11', 'measure': 90},
                          {'domain': '12', 'measure': 100},
                          {'domain': '13', 'measure': 30},
                        ],
                      },
                    ],
                    domainLabelPaddingToAxisLine: 16,
                    axisLineTick: 2,
                    axisLinePointTick: 2,
                    axisLinePointWidth: 8,
                    axisLineColor: Colors.green,
                    measureLabelPaddingToAxisLine: 16,
                    barColor: (barData, index, id) => Colors.green,
                  ),
                ),
              ),
              Positioned(
                top: 206,
                left: 40,
                child: Center(
                  child: Container(
                    color: Colors.white,
                    height: 90,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "30/08/2022",
                            style: TextStyle(fontSize: 8.5),
                          ),
                          Text(
                            "31/08/2022",
                            style: TextStyle(fontSize: 8.5),
                          ),
                          Text(
                            "01/09/2022",
                            style: TextStyle(fontSize: 8.5),
                          ),
                          Text(
                            "02/09/2022",
                            style: TextStyle(fontSize: 8.5),
                          ),
                          Text(
                            "03/09/2022",
                            style: TextStyle(fontSize: 8.5),
                          )
                          ,Text(
                            "04/09/2022",
                            style: TextStyle(fontSize: 8.5),
                          )
                          ,Text(
                            "05/09/2022",
                            style: TextStyle(fontSize: 8.5),
                          )
                      ],
                    ),
                  ),
                ),
              ),
              
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(35),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartLine(
                    data: [
                      {
                        'id': 'Line',
                        'data': [
                          {'domain': 0, 'measure': 11},
                          {'domain': 1, 'measure': 8},
                          {'domain': 2, 'measure': 33},
                          {'domain': 3, 'measure': 75},
                          {'domain': 4, 'measure': 79},
                          {'domain': 5, 'measure': 23},
                          {'domain': 6, 'measure': 8},
                          {'domain': 7, 'measure': 72},
                          {'domain': 8, 'measure': 65},
                          {'domain': 9, 'measure': 60},
                          {'domain': 10, 'measure': 52},
                          {'domain': 11, 'measure': 61},
                          {'domain': 12, 'measure': 64},
                          {'domain': 13, 'measure': 23},
                        ],
                      },
                    ],
                    includePoints: true,
                    lineColor: (lineData, index, id) => Colors.green,
                  ),
                ),
              ),
              Positioned(
                top: 210,
                left: 50,
                child: Center(
                  child: Container(
                    color: Colors.white,
                    height: 90,
                    width: 315,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < 7; i++)
                              Text(
                                "Dia ${(i + 1)}",
                                style: TextStyle(fontSize: 8.5),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Dias",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 105,
                child: Transform.rotate(
                    angle: -1.58,
                    child: Text("PM :2.5",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ],
      ),
    );
  }
}
