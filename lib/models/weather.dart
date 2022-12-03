class Weather {
  final int    pm25;
  final int    pm10;
  final double ozone;
  final int    temperature;
  final double pressure;
  final int    humidity;
  final int    wind;
  final int    aqi;

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

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      pm25:         json['data']['iaqi']['pm25']['v'],
      pm10:         json['data']['iaqi']['pm10']['v'],
      ozone:        json['data']['iaqi']['o3']['v'],
      temperature:  json['data']['iaqi']['t']['v'],
      pressure:     json['data']['iaqi']['p']['v'],
      humidity:     json['data']['iaqi']['h']['v'],
      wind:         json['data']['iaqi']['w']['v'],
      aqi:         json['data']['aqi'],
    );
  }
}
