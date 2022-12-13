class Weather {
  final double pm25;
  final double pm10;
  final double ozone;
  final double temperature;
  final int pressure;
  final int humidity;
  final double wind;

  const Weather({
    required this.pm25,
    required this.pm10,
    required this.ozone,
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.wind,
  });

  factory Weather.fromJson(Map<String, dynamic> openw, Map<String, dynamic> aqair) {
    return Weather(
      pm25: openw['list'][0]['components']['pm2_5'],
      pm10: openw ['list'][0]['components']['pm10'],
      ozone: openw['list'][0]['components']['o3'],
      temperature: aqair['main']['temp'],
      pressure: aqair['main']['pressure'],
      humidity: aqair['main']['humidity'],
      wind: aqair['wind']['speed'],
    );
  }
}
