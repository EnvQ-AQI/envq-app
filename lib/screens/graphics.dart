import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class Graficas extends StatelessWidget {
  final datos = ["200", "150", "100", "50", "0"];

  Graficas({super.key});

  @override
  Widget build(BuildContext context) {
    final tam = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: tam.width * 0.9,
              height: tam.height * 0.2825,
              margin: EdgeInsets.only(
                  top: tam.height * 0.14, left: tam.width * 0.05),
              color: Colors.white,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: DChartBar(
                  data: const [
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
            Container(
              margin: EdgeInsets.only(
                top: tam.height * 0.393,
                left: tam.width * 0.11,
              ),
              color: Colors.white,
              width: tam.width * 0.88,
              height: tam.height * 0.035,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "30/08/2022",
                    style: TextStyle(fontSize: 8),
                  ),
                  Text(
                    "31/08/2022",
                    style: TextStyle(fontSize: 8),
                  ),
                  Text(
                    "01/09/2022",
                    style: TextStyle(fontSize: 8),
                  ),
                  Text(
                    "02/09/2022",
                    style: TextStyle(fontSize: 8),
                  ),
                  Text(
                    "03/09/2022",
                    style: TextStyle(fontSize: 8),
                  ),
                  Text(
                    "04/09/2022",
                    style: TextStyle(fontSize: 8),
                  ),
                  Text(
                    "05/09/2022",
                    style: TextStyle(fontSize: 8),
                  ),
                ],
              ),
            ),
            Positioned(
              top: tam.height * 0.763,
              left: tam.width * 0.09,
              child: Container(
                color: Colors.white,
                width: tam.width * 0.83,
                height: tam.height * 0.04,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < 7; i++)
                          Text(
                            "Dia ${(i + 1)}",
                            style: const TextStyle(fontSize: 8.5),
                          ),
                      ],
                    ),
                    const Text("Dias",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Positioned(
              top: tam.height * 0.27,
              child: Transform.rotate(
                  angle: -1.58,
                  child: const Text("PM :2.5",
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold))),
            )
          ],
        ),
      ),
    );
  }
}
