import 'package:fpdart/fpdart.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/usecase/usecase.dart';
import 'package:weather_app/feature/weather/domain/entities/location_entity.dart';
import 'package:weather_app/feature/weather/domain/repositories/location_repository.dart';

class GetLocation implements UseCase<LocationEntity, NoParams> {
  final LocationRepository locationRepository;
  GetLocation(this.locationRepository);

  @override
  Future<Either<Failure, LocationEntity>> call(NoParams params) async {
    return await locationRepository.getUserLocation();
  }
}
