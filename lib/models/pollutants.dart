class Pollutants {
  final num pm25;
  final num pm10;
  final num ozone;

  const Pollutants({
    required this.pm25,
    required this.pm10,
    required this.ozone,
  });

  factory Pollutants.fromJson(Map<String, dynamic> data) {
    return Pollutants(
      pm25: data['components']['pm2_5'],
      pm10: data['components']['pm10'],
      ozone: data['components']['o3'],
    );
  }
}
