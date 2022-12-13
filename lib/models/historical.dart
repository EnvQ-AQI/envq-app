class Historical {
  final List<dynamic> pollutants;
  final List<dynamic> weather;

  const Historical({
    required this.pollutants,
    required this.weather,
  });

  factory Historical.fromJson(Map<String, dynamic> polls, Map<String, dynamic> weather) {
    return Historical(
      pollutants: polls['list'],
      weather: weather['list'],
    );
  }
}
