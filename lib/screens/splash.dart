import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
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
                  height: 150,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
