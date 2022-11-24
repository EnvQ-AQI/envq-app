import 'dart:async';
import 'package:flutter/material.dart';

import 'estadisticas.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => EstadisticasScreen())));
    Timer(const Duration(seconds:3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const EstadisticasScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xFF12B04E),
            Color(0xFF6DD5DE),
          ],
        ),
      ),
      child: Stack(children: <Widget>[
        Center(
          child: Image.asset(
            "assets/images/Logo.png",
            height: 100,
          ),
        ),
      ]),
    );
  }
}
