import 'package:flutter/material.dart';

import '../models/station.dart';

class Utility {
  ///
  void showError(String msg) {
    ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  ///
  Map<String, StationModel> getComplementDummyMap() {
    final Map<String, StationModel> map = <String, StationModel>{};

    const String str = '''
広島港,広島県広島市南区宇品海岸3-12,34.353681,132.463724,
宮島,広島県廿日市市宮島町,34.264138,132.277278,
三峯神社,埼玉県秩父市三峰298-1,35.921365,138.9323,
牛房,埼玉県和光市白子1-24,35.773293,139.624237,
三ツ沢公園自由広場,神奈川県横浜市神奈川区三ツ沢西町3,35.470428,139.602768,
三ツ沢総合グランド入口,神奈川県横浜市神奈川区三ツ沢西町3,35.470428,139.602768,
岡野町,神奈川県横浜市西区岡野1-14,35.463871,139.614517,
免許センター,千葉県千葉市美浜区浜田2,35.657168,140.032542,
アンデルセン公園西口,千葉県船橋市金堀町525,35.756326,140.049741,
金町三丁目,東京都葛飾区金町2-28,35.766079,139.871062,
善福寺,東京都杉並区善福寺3-2,35.717392,139.594481,
都立和田堀公園,東京都杉並区大宮2-26,35.683926,139.641495,
八丁,東京都杉並区桃井2-1,35.71056,139.610961,
塩船観音入口,東京都青梅市大門1,35.799177,139.288852,
青渭神社前,東京都調布市深大寺元町5,35.669219,139.549651,
かみのね橋,東京都板橋区小茂根3-4,35.751021,139.681655,
環八若木二丁目,東京都板橋区西台1-2,35.771403,139.671234,
天神町二丁目,東京都府中市天神町2,35.680443,139.490997,
青梅街道営業所,東京都練馬区関町南1-7,35.72051,139.590587,
関町南二丁目,東京都練馬区関町南2-23,35.717411,139.583221,
高松三丁目,東京都練馬区高松3-6,35.747746,139.626038,
立野橋,東京都練馬区上石神井1-11,35.724258,139.591492,
旭町一丁目,東京都練馬区旭町1-9,35.763267,139.620285,
''';

    final List<String> exStr = str.split('\n');

    for (final String element in exStr) {
      if (element != '') {
        final List<String> exElement = element.split(',');

        map[exElement[0]] = StationModel(
          id: 0,
          trainNumber: '',
          stationName: exElement[0].trim(),
          address: exElement[1].trim(),
          lat: exElement[2].trim(),
          lng: exElement[3].trim(),
          prefecture: '',
        );
      }
    }

    return map;
  }
}

class NavigationService {
  const NavigationService._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
