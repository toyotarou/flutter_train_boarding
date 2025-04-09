import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../const/const.dart';
import '../../controllers/controllers_mixin.dart';
import '../../extensions/extensions.dart';
import '../../models/station_lat_lng.dart';
import '../../service/numbered_polylines_service.dart';
import '../../service/route_pairing_service.dart';
import '../../utility/tile_provider.dart';

class TrainBoardingMapAlert extends ConsumerStatefulWidget {
  const TrainBoardingMapAlert(
      {super.key,
      required this.stationLatLngDateList,
      required this.date,
      required this.oddStationList,
      required this.evenStationList});

  final String date;
  final List<List<StationLatLng>> stationLatLngDateList;
  final List<StationLatLng> oddStationList;
  final List<StationLatLng> evenStationList;

  @override
  ConsumerState<TrainBoardingMapAlert> createState() => _TrainBoardingMapAlertState();
}

class _TrainBoardingMapAlertState extends ConsumerState<TrainBoardingMapAlert>
    with ControllersMixin<TrainBoardingMapAlert> {
  late PairingResult pairingResult;

  List<List<StationLatLng>> polylineSourceList = <List<StationLatLng>>[];

  final MapController _mapController = MapController();

  static final List<Color> _polylineColors = <Color>[
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  List<double> latList = <double>[];
  List<double> lngList = <double>[];

  double minLat = 0.0;
  double maxLat = 0.0;
  double minLng = 0.0;
  double maxLng = 0.0;

  ///
  @override
  void initState() {
    super.initState();

    pairingResult = RoutePairingService.pairRoutes(widget.stationLatLngDateList);
  }

  ///
  @override
  Widget build(BuildContext context) {
    List<int> jogaiList = <int>[];
    if (pairingResult.pairs.isNotEmpty) {
      jogaiList = pairingResult.pairs.map((List<int> subList) => subList[1]).toList();
    }

    polylineSourceList = widget.stationLatLngDateList
        .asMap()
        .entries
        .where((MapEntry<int, List<StationLatLng>> entry) => !jogaiList.contains(entry.key))
        .map((MapEntry<int, List<StationLatLng>> entry) => entry.value)
        .toList();

    // ////////////////////////
    //
    // for (final List<StationLatLng> element in polylineSourceList) {
    //   final List<String> staList = <String>[];
    //
    //   for (final StationLatLng element2 in element) {
    //     staList.add(element2.stationName);
    //   }
    //
    //   print(staList.join('-'));
    // }
    //
    // print('----------');
    //
    // print(pairingResult.pairs);
    //
    // print(jogaiList);
    //
    // print(polylineSourceList);
    //
    // ////////////////////////

    /*

I/flutter (12348): 下総中山-新小岩-横浜
I/flutter (12348): ----------
I/flutter (12348): [[0, 1]]
I/flutter (12348): [1]
I/flutter (12348): [[Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng']]


I/flutter (12348): 下総中山-秋葉原-駒込
I/flutter (12348): 駒込-溜池山王-銀座
I/flutter (12348): 銀座-日本橋-西船橋
I/flutter (12348): ----------
I/flutter (12348): []
I/flutter (12348): []
I/flutter (12348): [
  [Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng'],
  [Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng'],
  [Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng']
]


I/flutter (12348): 青梅街道営業所-荻窪-東京
I/flutter (12348): 東京-新大阪-天王寺
I/flutter (12348): 阿倍野-天王寺-新大阪-東京
I/flutter (12348): ----------
I/flutter (12348): [[0, 3]]
I/flutter (12348): [3]
I/flutter (12348): [
  [Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng'],
  [Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng'],
  [Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng']
]


2021.09.04
I/flutter (12348): 京成西船-京成成田
I/flutter (12348): 成田-香取
I/flutter (12348): ----------
I/flutter (12348): [[1, 2], [0, 3]]
I/flutter (12348): [2, 3]
I/flutter (12348): [
  [Instance of 'StationLatLng', Instance of 'StationLatLng'],
  [Instance of 'StationLatLng', Instance of 'StationLatLng']
]



    */

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            FlutterMap(
              mapController: _mapController,
              options: const MapOptions(initialCenter: LatLng(35.6895, 139.6917), initialZoom: 11),
              children: <Widget>[
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  tileProvider: CachedTileProvider(),
                  userAgentPackageName: 'com.example.app',
                ),
                NumberedPolylinesWidget(
                    polylines: polylineSourceList, colors: _polylineColors, onMarkerTap: _onMarkerTap),
              ],
            ),
            DefaultTextStyle(
              style: const TextStyle(color: Colors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.date),
                  Text('root num : ${widget.stationLatLngDateList.length}'),
                  Text('odd length : ${widget.oddStationList.length}'),
                  Text('even length : ${widget.evenStationList.length}'),
                  Divider(
                    color: Colors.white.withOpacity(0.3),
                    thickness: 5,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: polylineSourceList.asMap().entries.map(
                      (MapEntry<int, List<StationLatLng>> outerEntry) {
                        final int outerIdx = outerEntry.key;
                        final List<StationLatLng> stations = outerEntry.value;

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(outerIdx.toString()),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: stations.asMap().entries.map(
                                (MapEntry<int, StationLatLng> innerEntry) {
                                  final int innerIdx = innerEntry.key;
                                  final StationLatLng station = innerEntry.value;

                                  return Text('$outerIdx-$innerIdx : ${station.stationName}');
                                },
                              ).toList(),
                            ),
                            const SizedBox(height: 30),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: Column(
                children: <Widget>[
                  FloatingActionButton.small(
                      heroTag: 'zoomIn', onPressed: () => _zoom(1), child: const Icon(Icons.add)),
                  const SizedBox(height: 8),
                  FloatingActionButton.small(
                      heroTag: 'zoomOut', onPressed: () => _zoom(-1), child: const Icon(Icons.remove)),
                ],
              ),
            ),
            Positioned(
              right: 10,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {
                        appParamNotifier.setSelectedStartHome(num: 0);
                      },
                      icon: Icon(
                        Icons.home,
                        color: (appParamState.selectedStartHome == 0) ? Colors.redAccent : Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {
                        appParamNotifier.setSelectedStartHome(num: 1);
                      },
                      icon: Icon(
                        Icons.home,
                        color: (appParamState.selectedStartHome == 1) ? Colors.redAccent : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///
  void _onMarkerTap(int index) {
    final List<StationLatLng> stations = polylineSourceList[index];
    final String stationNames = stations.map((StationLatLng s) => s.stationName).join('\n'); // 改行区切りに
    // ignore: inference_failure_on_function_invocation
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Polyline ${index + 1} Stations'),
        content: Text(stationNames),
        actions: <Widget>[
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close')),
        ],
      ),
    );
  }

  ///
  void _zoom(double delta) {
    final MapCamera cam = _mapController.camera;
    _mapController.move(cam.center, cam.zoom + delta);
  }

  ///
  void makeMinMaxLatLng() {
    latList = <double>[];
    lngList = <double>[];

    if (appParamState.selectedStartHome == 0) {
      latList.add(zenpukujiLat);
      lngList.add(zenpukujiLng);
    }

    if (appParamState.selectedStartHome == 1) {
      latList.add(funabashiLat);
      lngList.add(funabashiLng);
    }

    for (final List<StationLatLng> element in widget.stationLatLngDateList) {
      for (final StationLatLng element2 in element) {
        latList.add(element2.lat.toDouble());
        lngList.add(element2.lng.toDouble());
      }
    }

    if (latList.isNotEmpty && lngList.isNotEmpty) {
      minLat = latList.reduce(min);
      maxLat = latList.reduce(max);
      minLng = lngList.reduce(min);
      maxLng = lngList.reduce(max);
    }
  }
}
