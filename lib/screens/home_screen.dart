import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/controllers_mixin.dart';
import '../models/station.dart';
import '../models/station_lat_lng.dart';
import '../models/train_boarding.dart';
import '../utility/utility.dart';
import 'components/not_match_train_name_display_alert.dart';
import 'components/train_boarding_map_alert.dart';
import 'parts/train_boarding_dialog.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with ControllersMixin<HomeScreen> {
  Utility utility = Utility();

  Map<String, List<List<StationLatLng>>> stationLatLngDateMap = <String, List<List<StationLatLng>>>{};

  List<String> trainBoardingList = <String>[];

  ///
  @override
  void initState() {
    super.initState();

    trainBoardingNotifier.getAllTrainBoarding();

    stationNotifier.getAllStation();

    trainNotifier.getAllTrain();

    geolocNotifier.getAllGeoloc();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final List<Map<String, String>> notMatchTrainNameMapList = <Map<String, String>>[];

              for (final String element in trainBoardingList) {
                final List<String> exElement = element.split('-');

                for (int i = 1; i < exElement.length; i++) {
                  final List<String>? sntnmBefore = stationState.stationNameTrainNumberMap[exElement[i - 1]];
                  final List<String>? sntnmThis = stationState.stationNameTrainNumberMap[exElement[i]];

                  String trainNumber = '';

                  sntnmBefore?.forEach((String element) {
                    sntnmThis?.forEach((String element2) {
                      if (element == element2) {
                        trainNumber = element;
                      }
                    });
                  });

                  if (trainNumber == '') {
                    if ((exElement[i - 1] == '上野' && exElement[i] == '長野') ||
                        (exElement[i - 1] == '長野' && exElement[i] == '上野')) {
                    } else if ((exElement[i - 1] == '東京' && exElement[i] == '新大阪') ||
                        (exElement[i - 1] == '新大阪' && exElement[i] == '東京')) {
                    } else if ((exElement[i - 1] == '宮島口' && exElement[i] == '宮島') ||
                        (exElement[i - 1] == '宮島' && exElement[i] == '宮島口')) {
                    } else if ((exElement[i - 1] == '宮島' && exElement[i] == '広島港') ||
                        (exElement[i - 1] == '広島港' && exElement[i] == '宮島')) {
                    } else {
                      notMatchTrainNameMapList
                          .add(<String, String>{'fromStation': exElement[i - 1], 'toStation': exElement[i]});
                    }
                  }
                }
              }

              TrainBoardingDialog(
                context: context,
                widget: NotMatchTrainNameDisplayAlert(notMatchTrainNameMapList: notMatchTrainNameMapList),
              );
            },
            icon: const Icon(Icons.check_box),
          ),
        ],
      ),
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    displayYearList(),
                    const SizedBox.shrink(),
                  ],
                ),
              ),
              Expanded(child: displayTrainBoardingList()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget displayYearList() {
    final List<String> yearList = <String>['-'];

    trainBoardingState.trainBoardingDateMap.forEach((String key, TrainBoardingModel value) {
      final List<String> exKey = key.split('-');

      if (!yearList.contains(exKey[0])) {
        yearList.add(exKey[0]);
      }
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: yearList.map(
          (String e) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  appParamNotifier.setSelectedYear(year: e);

                  // ignore: inference_failure_on_instance_creation, always_specify_types
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                },
                child: CircleAvatar(
                  backgroundColor: (appParamState.selectedYear == e)
                      ? Colors.yellowAccent.withOpacity(0.2)
                      : Colors.white.withOpacity(0.2),
                  child: Text(e, style: const TextStyle(fontSize: 12)),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  ///
  Widget displayTrainBoardingList() {
    final Map<String, StationModel> complementDummyMap = utility.getComplementDummyMap();

    final List<Widget> displayList = <Widget>[];

    trainBoardingState.trainBoardingDateMap.forEach((String key, TrainBoardingModel value) {
      stationLatLngDateMap[key] = <List<StationLatLng>>[];
    });

    trainBoardingState.trainBoardingDateMap.forEach((String key, TrainBoardingModel value) {
      final List<String> exKey = key.split('-');

      if (appParamState.selectedYear == '-' || appParamState.selectedYear == exKey[0]) {
        final List<Widget> displayList2 = <Widget>[];

        final List<List<StationLatLng>> list2 = <List<StationLatLng>>[];

        value.station.split('\r\n').forEach((String element) {
          if (element.trim() != '') {
            trainBoardingList.add(element.trim());

            final List<Widget> displayList3 = <Widget>[];

            final List<StationLatLng> list3 = <StationLatLng>[];

            element.split('-').forEach(
              (String element2) {
                StationModel? station = stationState.stationNameMap[element2];

                station ??= complementDummyMap[element2];

                displayList3.add(
                  Container(
                    width: 160,
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.4)),
                      color: (station == null) ? Colors.purple.withOpacity(0.2) : Colors.transparent,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(element2, maxLines: 1, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 10),
                        Text((station != null) ? station.lat : '-----'),
                        Text((station != null) ? station.lng : '-----'),
                      ],
                    ),
                  ),
                );

                if (station != null) {
                  list3.add(StationLatLng(stationName: element2, lat: station.lat, lng: station.lng));
                }
              },
            );

            list2.add(list3);

            displayList2.add(
              SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: displayList3)),
            );
          }
        });

        displayList.add(
          Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(color: Colors.yellowAccent.withOpacity(0.2)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    Text(key),
                    GestureDetector(
                      onTap: () {
                        appParamNotifier.setSelectedStartHome(num: 0);

                        TrainBoardingDialog(
                          context: context,
                          widget: TrainBoardingMapAlert(
                            date: key,
                            stationLatLngDateList: stationLatLngDateMap[key] ?? <List<StationLatLng>>[],
                          ),
                        );
                      },
                      child: const Icon(Icons.map),
                    ),
                  ]),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: displayList2,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );

        stationLatLngDateMap[key] = list2;
      }
    });

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => displayList[index],
            childCount: displayList.length,
          ),
        ),
      ],
    );
  }

// ///
// ({List<StationLatLng> odd, List<StationLatLng> even}) makeKisuuGuusuuStationList(
//     List<List<StationLatLng>> stationLatLngDateList) {
//   final Map<String, int> countMap = <String, int>{};
//   final Map<String, StationLatLng> stationInfoMap = <String, StationLatLng>{};
//
//   for (final List<StationLatLng> dailyList in stationLatLngDateList) {
//     for (final StationLatLng station in dailyList) {
//       /*
//
//       ①	key	いま数えたい駅名 (station.stationName) をキーにする
//       ②	update	その駅名が すでにマップにある 場合に実行される関数。
//       prev は現在格納されている出現回数なので、prev + 1 で 1 増やして返す。
//       ③	ifAbsent	その駅名が まだマップに無い 場合に実行される関数。
//       初回なので出現回数を 1 として返す。
//
//       */
//
//       countMap.update(station.stationName, (int prev) => prev + 1, ifAbsent: () => 1);
//
//       stationInfoMap.putIfAbsent(station.stationName, () => station);
//     }
//   }
//
//   final List<StationLatLng> odd = <StationLatLng>[];
//   final List<StationLatLng> even = <StationLatLng>[];
//
//   for (final MapEntry<String, int> entry in countMap.entries) {
//     final StationLatLng station = stationInfoMap[entry.key]!;
//     (entry.value.isOdd ? odd : even).add(station);
//   }
//
//   return (odd: odd, even: even);
// }
}
