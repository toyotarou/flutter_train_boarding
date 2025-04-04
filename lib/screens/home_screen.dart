import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/controllers_mixin.dart';
import '../extensions/extensions.dart';
import '../models/station.dart';
import '../models/station_lat_lng.dart';
import '../models/train_boarding.dart';
import '../utility/utility.dart';
import 'components/dummy_alert.dart';
import 'parts/train_boarding_dialog.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with ControllersMixin<HomeScreen> {
  Utility utility = Utility();

  Map<String, List<StationLatLng>> stationLatLngDateMap = <String, List<StationLatLng>>{};

  ///
  @override
  void initState() {
    super.initState();

    trainBoardingNotifier.getAllTrainBoarding();

    stationNotifier.getAllStation();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

    final List<Widget> list = <Widget>[];

    trainBoardingState.trainBoardingDateMap.forEach((String key, TrainBoardingModel value) {
      stationLatLngDateMap[key] = <StationLatLng>[];
    });

    trainBoardingState.trainBoardingDateMap.forEach(
      (String key, TrainBoardingModel value) {
        final List<String> exKey = key.split('-');

        if (appParamState.selectedYear == '-' || appParamState.selectedYear == exKey[0]) {
          final List<String> stationList = <String>[];

          String keepStation = '';
          value.station.split('\r\n').forEach(
            (String element) {
              element.split('-').forEach(
                (String element2) {
                  if (keepStation != element2.trim()) {
                    stationList.add(element2.trim());
                  }

                  keepStation = element2.trim();
                },
              );
            },
          );

          list.add(
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(key),
                      IconButton(
                        onPressed: () {
                          TrainBoardingDialog(
                            context: context,
                            widget: DummyAlert(
                              date: key,
                              stationLatLngList: stationLatLngDateMap[key] ?? <StationLatLng>[],
                            ),
                          );
                        },
                        icon: const Icon(Icons.pages),
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: stationList.map(
                      (String e) {
                        if (e == '') {
                          return const SizedBox.shrink();
                        }

                        StationModel? station = stationState.stationNameMap[e];

                        station ??= complementDummyMap[e];

                        if (station != null) {
                          stationLatLngDateMap[key]?.add(
                            StationLatLng(stationName: e, lat: station.lat, lng: station.lng),
                          );
                        }

                        return Container(
                          width: context.screenSize.width,
                          decoration: BoxDecoration(
                              color: (station == null) ? Colors.purple.withOpacity(0.2) : Colors.transparent),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(e),
                                  const SizedBox.shrink(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const SizedBox.shrink(),
                                  Text((station != null) ? '${station.lat} / ${station.lng}' : '-----'),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) => list[index], childCount: list.length),
        ),
      ],
    );
  }
}
