import '../extensions/extensions.dart';

class TrainModel {
  TrainModel({
    required this.id,
    required this.trainNumber,
    required this.trainName,
    required this.companyId,
    required this.orderNumber,
    this.pickup,
    this.tokyoTrain,
  });

  factory TrainModel.fromJson(Map<String, dynamic> json) => TrainModel(
        id: json['id'].toString().toInt(),
        trainNumber: json['train_number'].toString(),
        trainName: json['train_name'].toString(),
        companyId: json['company_id'].toString().toInt(),
        orderNumber: json['order_number'].toString().toInt(),
        pickup: (json['pickup'] != null) ? json['pickup'].toString() : '',
        tokyoTrain: (json['tokyo_train'] != null) ? json['tokyo_train'].toString().toInt() : 0,
      );
  int id;
  String trainNumber;
  String trainName;
  int companyId;
  int orderNumber;
  String? pickup;
  int? tokyoTrain;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'train_number': trainNumber,
        'train_name': trainName,
        'company_id': companyId,
        'order_number': orderNumber,
        'pickup': pickup,
        'tokyo_train': tokyoTrain
      };
}
