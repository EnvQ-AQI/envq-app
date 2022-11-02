class Weather {
  final double temperatureValue;
  final String temperatureUnit;

  final int humidity;

  final int windDirection;
  final double windSpeedValue;
  final String windSpeedUnit;

  final double pressureValue;
  final String pressureUnit;

  const Weather({
    required this.temperatureValue,
    required this.temperatureUnit,
    required this.humidity,
    required this.windDirection,
    required this.windSpeedValue,
    required this.windSpeedUnit,
    required this.pressureValue,
    required this.pressureUnit
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperatureValue: json['Temperature']['Metric']['Value'],
      temperatureUnit:  json['Temperature']['Metric']['Unit'],
      humidity:         json['RelativeHumidity'],
      windDirection:    json['Wind']['Direction']['Degrees'],
      windSpeedValue:   json['Temperature']['Metric']['Value'],
      windSpeedUnit:    json['Temperature']['Metric']['Unit'],
      pressureValue:    json['Pressure']['Metric']['Value'],
      pressureUnit:     json['Pressure']['Metric']['Unit']
    );
  }
}