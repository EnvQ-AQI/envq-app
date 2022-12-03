import 'package:bases_flutter/services/weather_services.dart';
import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier {
  final _service = WeatherService();
  bool isLoading = false;
  
  List<String> _weather = [];
  List<String> get weather => _weather;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.fetchWeather();

    _weather = response;
    isLoading = false;
    notifyListeners();
  }
}