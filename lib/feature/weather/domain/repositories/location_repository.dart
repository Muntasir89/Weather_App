import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/feature/weather/domain/entities/location_entity.dart';

abstract interface class LocationRepository {
  Future<Either<Failure, LocationEntity>> getUserLocation();
}
