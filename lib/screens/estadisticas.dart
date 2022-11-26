import 'package:bases_flutter/provider/est.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EstadisticasScreen extends StatelessWidget {
  const EstadisticasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int rango = 99;
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

    final c = Provider.of<Est>(context, listen: false);

    c.tipoColor(rango);
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
                          onPressed: () {},
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
                              image: AssetImage("assets/Viento.png"),
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
            GestureDetector(onTap: () {
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
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: tam.width*0.035)),
                       Text("25",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: tam.width*0.035))
                      ],
                    ),
                    Divider(
                      height: tam.height * 0.030,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            )
        ],
      )),
    );
  }
}
