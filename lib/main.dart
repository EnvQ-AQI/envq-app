import 'package:bases_flutter/provider/est.dart';
import 'package:bases_flutter/screens/estadisticas.dart';
import 'package:bases_flutter/screens/graficas.dart';
import 'package:bases_flutter/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Est()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
        initialRoute: "Home",
        routes: {"Home":(context) => EstadisticasScreen(),"Graficas":(context) => Graficas()},
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        );
  }
}
