import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/external/services/location_services.dart';
import 'package:weather_app/feature/weather/domain/entities/location_entity.dart';
import 'package:weather_app/feature/weather/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationService locationService;

  LocationRepositoryImpl(this.locationService);

  @override
  Future<Either<Failure, LocationEntity>> getUserLocation() async {
    try {
      final userLocation = await locationService.getUserLocation();
      return right(userLocation);
    } on CustomException catch (e) {
      return left(Failure(e.message));
    }
  }
}
