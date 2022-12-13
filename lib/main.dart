import 'package:bases_flutter/provider/color_provider.dart';
import 'package:bases_flutter/provider/current_weather_provider.dart';
import 'package:bases_flutter/provider/date_manager_provider.dart';
import 'package:bases_flutter/provider/historical_weather_provider.dart';
import 'package:bases_flutter/screens/splash.dart';
import 'package:bases_flutter/screens/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorModel()),
        ChangeNotifierProvider(create: (_) => DateManagerProvider()),
        ChangeNotifierProvider(create: (_) => CurrentWeatherProvider()),
        ChangeNotifierProvider(create: (_) => HistoricalWeatherProvider()),
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
          "Home": (context) => const StatsScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es'),
        ],
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
