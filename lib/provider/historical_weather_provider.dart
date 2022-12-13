import 'package:bases_flutter/services/current_weather_services.dart';
import 'package:bases_flutter/services/historical_weather_services.dart';
import 'package:flutter/material.dart';

class HistoricalWeatherProvider extends ChangeNotifier {
  final _service = HistoricalService();
  bool isLoading = false;

  List<List<Map<String, dynamic>>> _history = [];

  List<List<Map<String, dynamic>>> get history => _history;

  Future<void> getWeatherData() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.fetchHistoryRange(
      (DateTime.now().subtract(const Duration(days: 8)).millisecondsSinceEpoch / 1000).round(),
        (DateTime.now().millisecondsSinceEpoch / 1000).round()
    );
    _history = response;

    isLoading = false;
    notifyListeners();
  }

  Future<void> getWeatherDataRange(int start, int end) async {
    isLoading = true;
    notifyListeners();

    final response = await _service.fetchHistoryRange(start, end);
    _history = response;

    isLoading = false;
    notifyListeners();
  }
}
