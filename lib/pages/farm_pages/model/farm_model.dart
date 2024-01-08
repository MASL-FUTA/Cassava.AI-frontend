class Farm {
  final String name;
  final double temperature;
  final WeatherCondition weatherCondition;

  Farm({
    required this.name,
    required this.temperature,
    required this.weatherCondition,
  });
}

enum WeatherCondition {
  sunny,
  rainy,
  windy,
}