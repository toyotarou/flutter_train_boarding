class DupSpotModel {
  DupSpotModel({
    required this.id,
    required this.name,
    required this.area,
  });

  factory DupSpotModel.fromJson(Map<String, dynamic> json) {
    return DupSpotModel(
      id: json['id'] as int,
      name: json['name'] as String,
      area: json['area'] as String,
    );
  }

  final int id;
  final String name;
  final String area;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'area': area,
    };
  }
}
