class TrainBoardingModel {
  TrainBoardingModel({
    required this.date,
    required this.station,
    required this.price,
    required this.oufuku,
  });

  factory TrainBoardingModel.fromJson(Map<String, dynamic> json) => TrainBoardingModel(
        date: DateTime.parse('${json["date"]} 00:00:00'),
        station: json['station'].toString(),
        price: json['price'].toString(),
        oufuku: json['oufuku'].toString(),
      );
  DateTime date;
  String station;
  String price;
  String oufuku;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date':
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        'station': station,
        'price': price,
        'oufuku': oufuku,
      };
}
