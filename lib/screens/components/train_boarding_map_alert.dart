import 'package:flutter/material.dart';

import '../../models/station_lat_lng.dart';

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
  ///
  @override
  Widget build(BuildContext context) {
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
