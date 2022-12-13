class WeatherComponents {
  final num temperature;
  final int pressure;
  final int humidity;
  final num wind;

  const WeatherComponents({
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.wind,
  });

  factory WeatherComponents.fromJson(Map<String, dynamic> components) {
    return WeatherComponents(
      temperature: components['main']['temp'],
      pressure: components['main']['pressure'],
      humidity: components['main']['humidity'],
      wind: components['wind']['speed'],
    );
  }
}
