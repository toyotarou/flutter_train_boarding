import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/controllers_mixin.dart';
import '../../extensions/extensions.dart';
import '../../models/station_lat_lng.dart';

class PolylineStationInfoAlert extends ConsumerStatefulWidget {
  const PolylineStationInfoAlert({
    super.key,
    required this.stations,
    required this.index,
    required this.soeji0List,
    required this.stationNameTrainNumberMap,
  });

  final int index;
  final List<StationLatLng> stations;
  final List<int> soeji0List;

  final Map<String, List<String>> stationNameTrainNumberMap;

  @override
  ConsumerState<PolylineStationInfoAlert> createState() => _PolylineStationInfoAlertState();
}

class _PolylineStationInfoAlertState extends ConsumerState<PolylineStationInfoAlert>
    with ControllersMixin<PolylineStationInfoAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: context.screenSize.width),
            if (widget.soeji0List.contains(widget.index)) ...<Widget>[
              const SizedBox(height: 10),
              const Text('往復', style: TextStyle(color: Colors.yellowAccent, fontSize: 20)),
              const SizedBox(height: 10),
            ],
            displayPolylineStations(),
            displayPolylineTrain(),
          ],
        ),
      ),
    );
  }

  ///
  Widget displayPolylineStations() {
    final List<Widget> list = <Widget>[];

    final int flag = (widget.soeji0List.contains(widget.index)) ? 2 : 1;

    widget.stations.asMap().entries.forEach((MapEntry<int, StationLatLng> element) {
      list.add(
        Row(
          children: <Widget>[
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(element.value.stationName, style: const TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(width: 10),
          ],
        ),
      );

      if (element.key < widget.stations.length - 1) {
        list.add(
          (flag == 2) ? const Icon(FontAwesomeIcons.arrowRightArrowLeft) : const Icon(FontAwesomeIcons.arrowRight),
        );
      }
    });

    return SizedBox(
      height: 40,
      child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: list)),
    );
  }

  ///
  Widget displayPolylineTrain() {
    //////////////////////////////////////////////////////
    final List<String> trainNumberList = <String>[];

    for (int i = 0; i < widget.stations.length; i++) {
      if (i > 0) {
        final List<String>? sntnmBefore = widget.stationNameTrainNumberMap[widget.stations[i - 1].stationName];
        final List<String>? sntnmThis = widget.stationNameTrainNumberMap[widget.stations[i].stationName];

        sntnmBefore?.forEach((String element) {
          sntnmThis?.forEach((String element2) {
            if (element == element2) {
              trainNumberList.add(element);
            }
          });
        });

        if (trainNumberList.isEmpty || !trainNumberList.contains('0')) {
          trainNumberList.add('0');
        }
      }
    }

    //////////////////////////////////////////////////////

    final List<Widget> list = <Widget>[];

    list.add(
      Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: context.screenSize.width),
            DefaultTextStyle(
              style: const TextStyle(color: Colors.yellowAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: trainNumberList.map(
                  (String e) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(e),
                        Text((trainState.trainModelMap[e] != null) ? trainState.trainModelMap[e]!.trainName : ''),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );

    return SizedBox(
      height: 400,
      child: SingleChildScrollView(child: Column(children: list)),
    );
  }
}
