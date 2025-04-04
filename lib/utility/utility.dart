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
    return <String, StationModel>{
      '青梅街道営業所': StationModel(
        id: 0,
        trainNumber: '',
        stationName: '青梅街道営業所',
        address: '東京都練馬区関町南1-7',
        lat: '35.720510',
        lng: '139.590587',
        prefecture: '',
      ),
      '金町三丁目': StationModel(
        id: 0,
        trainNumber: '',
        stationName: '金町三丁目',
        address: '東京都葛飾区金町2-28',
        lat: '35.766079',
        lng: '139.871062',
        prefecture: '',
      ),
      '関町南二丁目': StationModel(
        id: 0,
        trainNumber: '',
        stationName: '関町南二丁目',
        address: '東京都練馬区関町南2-23',
        lat: '35.717411',
        lng: '139.583221',
        prefecture: '',
      ),
      '宮島': StationModel(
        id: 0,
        trainNumber: '',
        stationName: '宮島',
        address: '広島県廿日市市宮島町',
        lat: '34.264138',
        lng: '132.277278',
        prefecture: '',
      ),
      '広島港': StationModel(
        id: 0,
        trainNumber: '',
        stationName: '広島港',
        address: '広島県広島市南区宇品海岸3-12',
        lat: '34.353681',
        lng: '132.463724',
        prefecture: '',
      ),
      'アンデルセン公園西口': StationModel(
        id: 0,
        trainNumber: '',
        stationName: 'アンデルセン公園西口',
        address: '千葉県船橋市金堀町525',
        lat: '35.756326',
        lng: '140.049741',
        prefecture: '',
      ),
    };
  }
}

class NavigationService {
  const NavigationService._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
