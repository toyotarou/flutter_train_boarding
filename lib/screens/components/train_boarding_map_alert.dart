import 'package:flutter/material.dart';

import '../../models/station_lat_lng.dart';
import '../../service/route_pairing_service.dart';

class TrainBoardingMapAlert extends StatefulWidget {
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
  State<TrainBoardingMapAlert> createState() => _TrainBoardingMapAlertState();
}

class _TrainBoardingMapAlertState extends State<TrainBoardingMapAlert> {
  late PairingResult pairingResult;

  ///
  @override
  void initState() {
    super.initState();

    pairingResult = RoutePairingService.pairRoutes(widget.stationLatLngDateList);
  }

  ///
  @override
  Widget build(BuildContext context) {
//
//
//     for (final List<StationLatLng> element in widget.stationLatLngDateList) {
//       final List<String> staList = <String>[];
//
//       for (final StationLatLng element2 in element) {
//         staList.add(element2.stationName);
//       }
//
//       print(staList.join('-'));
//     }
//
//     print('----------');
//
//     print(pairingResult.pairs);
// //    print(pairingResult.pairIdOfIndex);
//     print(pairingResult.unpairedIndexes);
//     print(pairingResult.unpairedRoutes);

    /*



I/flutter ( 6220): 下総中山-新小岩-横浜
I/flutter ( 6220): 横浜-新小岩-下総中山
I/flutter ( 6220): ----------
I/flutter ( 6220): [[0, 1]]
// I/flutter ( 6220): [0, 0]
I/flutter ( 6220): []
I/flutter ( 6220): []


I/flutter ( 6220): 下総中山-秋葉原-駒込
I/flutter ( 6220): 駒込-溜池山王-銀座
I/flutter ( 6220): 銀座-日本橋-西船橋
I/flutter ( 6220): ----------
I/flutter ( 6220): []
// I/flutter ( 6220): [-1, -1, -1]
I/flutter ( 6220): [0, 1, 2]
I/flutter ( 6220): [
[Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng'],
[Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng'],
[Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng']
]


I/flutter ( 6220): 青梅街道営業所-荻窪-東京
I/flutter ( 6220): 東京-新大阪-天王寺
I/flutter ( 6220): 阿倍野-天王寺-新大阪-東京
I/flutter ( 6220): 東京-荻窪-青梅街道営業所
I/flutter ( 6220): ----------
I/flutter ( 6220): [[0, 3]]　　　　がペア
I/flutter ( 6220): [1, 2]　　　　がペアではない
I/flutter ( 6220): [
[Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng'],
[Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng', Instance of 'StationLatLng']
]

    */

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
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
              children: widget.stationLatLngDateList.asMap().entries.map(
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
    );
  }
}
