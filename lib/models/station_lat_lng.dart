import 'package:latlong2/latlong.dart';

class StationLatLng {
  StationLatLng({required this.stationName, required this.lat, required this.lng});

  String stationName;
  String lat;
  String lng;

  LatLng get toLatLng => LatLng(double.parse(lat), double.parse(lng));
}
