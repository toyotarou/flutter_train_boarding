import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/controllers_mixin.dart';
import '../models/station.dart';
import '../models/train_boarding.dart';
import '../utility/utility.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with ControllersMixin<HomeScreen> {
  Utility utility = Utility();

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
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                // ignore: inference_failure_on_instance_creation, always_specify_types
                MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()),
              );
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(children: <Widget>[Expanded(child: displayTrainBoardingList())]),
        ),
      ),
    );
  }

  ///
  Widget displayTrainBoardingList() {
    final Map<String, StationModel> complementDummyMap = utility.getComplementDummyMap();

    final List<Widget> list = <Widget>[];

    trainBoardingState.trainBoardingDateMap.forEach(
      (String key, TrainBoardingModel value) {
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
                Text(key),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: stationList.map(
                    (String e) {
                      if (e == '') {
                        return const SizedBox.shrink();
                      }

                      StationModel? station = stationState.stationNameMap[e];

                      station ??= complementDummyMap[e];

                      if (station == null) {
                        print(key);
                        print(e);
                        print('-----');
                      }

                      return Column(
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
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        );
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
