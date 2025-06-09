class BusStopAddressModel {
  BusStopAddressModel({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory BusStopAddressModel.fromJson(Map<String, dynamic> json) {
    return BusStopAddressModel(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );
  }

  final int id;
  final String name;
  final String address;
  final String latitude;
  final String longitude;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
