import '../../extensions/extensions.dart';

class BusInfoModel {
  BusInfoModel({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory BusInfoModel.fromJson(Map<String, dynamic> json) => BusInfoModel(
        id: json['id'].toString().toInt(),
        name: json['name'].toString(),
        address: json['address'].toString(),
        latitude: json['latitude'].toString(),
        longitude: json['longitude'].toString(),
      );

  int id;
  String name;
  String address;
  String latitude;
  String longitude;
}
