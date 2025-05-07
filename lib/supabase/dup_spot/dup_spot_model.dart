import '../../extensions/extensions.dart';

class DupSpotModel {
  DupSpotModel({
    required this.id,
    required this.name,
    required this.area,
  });

  factory DupSpotModel.fromJson(Map<String, dynamic> json) => DupSpotModel(
        id: json['id'].toString().toInt(),
        name: json['name'].toString(),
        area: json['area'].toString(),
      );

  int id;
  String name;
  String area;
}
