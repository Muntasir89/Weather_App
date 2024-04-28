import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as handler;

class LocationService {
  LocationService.init();
  static LocationService instance = LocationService.init();

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
      return false;
    }

    return Future.value(true);
  }

  Future<void> getUserLocation() async {
    if (!(await checkForServiceAvailability())) {
      // Here write something for not available for service
      // controller.errorDescription.value = "Service not enabled";
      // controller.updateIsAccessingLocation(false);
      return;
    }
    if (!(await checkForPermission())) {
      // "Permission not given";
      return;
    }

    final LocationData data = await _location.getLocation();
    // Location data got
  }
}