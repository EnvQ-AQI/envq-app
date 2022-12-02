class Weather {
  final double pm25;
  final double pm10;
  final double ozone;
  final int temperature;
  final int pressure;
  final int humidity;
  final double wind;
  final int aqi;

  const Weather({
    required this.pm25,
    required this.pm10,
    required this.ozone,
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.wind,
    required this.aqi,
  });

  factory Weather.fromJson(Map<String, dynamic> openw, Map<String, dynamic> aqair) {
    return Weather(
      pm25: openw['list'][0]['components']['pm2_5'],
      pm10: openw ['list'][0]['components']['pm10'],
      ozone: openw['list'][0]['components']['o3'],
      temperature: aqair['data']['current']['weather']['tp'],
      pressure: aqair['data']['current']['weather']['pr'],
      humidity: aqair['data']['current']['weather']['hu'],
      wind: aqair['data']['current']['weather']['ws'],
      aqi: aqair['data']['current']['pollution']['aqius'],
    );
  }
}
