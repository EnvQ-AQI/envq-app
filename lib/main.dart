import 'package:bases_flutter/models/est.dart';
import 'package:bases_flutter/screens/estadisticas.dart';
import 'package:bases_flutter/screens/graficas.dart';
import 'package:bases_flutter/screens/splash_screen.dart';
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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
        initialRoute: "Home",
        routes: {
          "Home": (context) => EstadisticasScreen(),
          "Graficas": (context) => Graficas()
        },
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(
            colorScheme: const ColorScheme(
                primary: Color.fromARGB(255, 18, 176, 78),
                secondary: Color.fromARGB(255, 51, 205, 219),
                surface: Color.fromARGB(255, 18, 176, 78),
                background: Color.fromARGB(255, 18, 176, 78),
                error: Color.fromARGB(255, 18, 176, 78),
                onPrimary: Colors.white,
                onSecondary: Color.fromARGB(255, 51, 205, 219),
                onSurface: Color.fromARGB(255, 18, 176, 78),
                onBackground: Color.fromARGB(255, 18, 176, 78),
                onError: Color.fromARGB(255, 18, 176, 78),
                brightness: Brightness.light)),
        home: SplashScreen());
  }
}
