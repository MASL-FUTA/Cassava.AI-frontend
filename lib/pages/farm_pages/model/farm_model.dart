import 'package:hive/hive.dart';

class Farm {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final double temperature;

  @HiveField(2)
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

// HiveAdapter.dart


class FarmAdapter extends TypeAdapter<Farm> {
  @override
  final typeId = 0;

  @override
  Farm read(BinaryReader reader) {
    return Farm(
      name: reader.readString(),
      temperature: reader.readDouble(),
      weatherCondition: WeatherCondition.values[reader.read()],
    );
  }

  @override
  void write(BinaryWriter writer, Farm obj) {
    writer.writeString(obj.name);
    writer.writeDouble(obj.temperature);
    writer.writeString(obj.weatherCondition.toString().split('.').last);
  }
}
