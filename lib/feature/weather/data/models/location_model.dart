import 'package:weather_app/feature/weather/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({
    required super.name,
    required super.longitude,
    required super.latitude,
  });

  LocationModel copyWith({
    String? name,
    double? longitude,
    double? latitude,
  }) {
    return LocationModel(
      name: name ?? this.name,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }
}
