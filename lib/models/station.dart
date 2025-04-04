import '../extensions/extensions.dart';

class StationModel {

  StationModel({
    required this.id,
    required this.trainNumber,
    required this.stationName,
    required this.address,
    required this.lat,
    required this.lng,
    required this.prefecture,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) => StationModel(
        id: json['id'].toString().toInt(),
        trainNumber: json['train_number'].toString(),
        stationName: json['station_name'].toString(),
        address: json['address'].toString(),
        lat: json['lat'].toString(),
        lng: json['lng'].toString(),
        prefecture: json['prefecture'].toString(),
      );
  int id;
  String trainNumber;
  String stationName;
  String address;
  String lat;
  String lng;
  String prefecture;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'train_number': trainNumber,
        'station_name': stationName,
        'address': address,
        'lat': lat,
        'lng': lng,
        'prefecture': prefecture,
      };
}
