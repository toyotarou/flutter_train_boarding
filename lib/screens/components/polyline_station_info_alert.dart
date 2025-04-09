import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';
import '../../models/station_lat_lng.dart';

class PolylineStationInfoAlert extends StatefulWidget {
  const PolylineStationInfoAlert({super.key, required this.stations, required this.index, required this.soeji0List});

  final int index;
  final List<StationLatLng> stations;
  final List<int> soeji0List;

  @override
  State<PolylineStationInfoAlert> createState() => _PolylineStationInfoAlertState();
}

class _PolylineStationInfoAlertState extends State<PolylineStationInfoAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: context.screenSize.width),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.stations.map(
                (StationLatLng e) {
                  return Text(e.stationName);
                },
              ).toList(),
            ),
            if (widget.soeji0List.contains(widget.index)) ...<Widget>[
              const SizedBox(height: 10),
              const Text(
                '往復',
                style: TextStyle(color: Colors.yellowAccent),
              ),
              const SizedBox(height: 10),
            ],
          ],
        ),
      ),
    );
  }
}
