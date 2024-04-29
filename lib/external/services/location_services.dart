import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as handler;
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/feature/weather/domain/entities/location_entity.dart';

abstract interface class LocationService {
  Future<LocationEntity> getUserLocation();
}

class LocationServiceImpl extends LocationService {
  // LocationService.init();
  // static LocationService instance = LocationService.init();

  final Location _location = Location();
  Future<bool> checkForServiceAvailability() async {
    bool isEnabled = await _location.serviceEnabled();
    if (isEnabled) {
      return Future.value(true);
    }

    isEnabled = await _location.requestService();

    if (isEnabled) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> checkForPermission() async {
    PermissionStatus status = await _location.hasPermission();

    if (status == PermissionStatus.denied) {
      status = await _location.requestPermission();
      if (status == PermissionStatus.granted) {
        return true;
      }
      return false;
    }
    if (status == PermissionStatus.deniedForever) {
      // "Permission Needed" "We use permission to get your location in order to give your service"
      throw const CustomException("Permission for location denied");
    }

    return Future.value(true);
  }

  @override
  Future<LocationEntity> getUserLocation() async {
    if (!(await checkForServiceAvailability())) {
      throw const CustomException("Location service not enabled");
    }
    if (!(await checkForPermission())) {
      throw const CustomException("Permission for location not given");
    }

    final LocationData data = await _location.getLocation();
    return LocationEntity(
        name: '', longitude: data.longitude!, latitude: data.latitude!);
  }
}
