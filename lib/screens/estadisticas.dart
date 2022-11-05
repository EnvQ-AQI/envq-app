import 'dart:ui';

import 'package:flutter/material.dart';

class EstadisticasScreen extends StatelessWidget {

  const EstadisticasScreen({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    List<String> info = [
      "PM 2.5",
      "PM 10",
      "Ozono (03)",
      "Temperatura",
      "Presion",
      "Humedad",
      "Vientos"
    ];
    
    final tam = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: tam.height * 0.015),
              width: double.infinity,
              height: tam.height * 0.45,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF12B04e), Color(0xFFCBE145)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "El Mante, Tamaulipas, México",
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                          onPressed: (){
                            showDatePicker(
                              context:context,
                              
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
                          "25",
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
                    "Bueno",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: tam.height * 0.04,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Puedes Salir a caminar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: tam.height * 0.020,
                    ),
                  ),
                  Text(
                    "Tempetartura 27°C",
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: tam.width * 0.080),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(info[i],
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Text("25",
                          style: TextStyle(fontWeight: FontWeight.bold))
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
