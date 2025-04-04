import 'package:flutter/material.dart';

import '../../models/station_lat_lng.dart';

class DummyAlert extends StatefulWidget {
  const DummyAlert({super.key, required this.date, required this.stationLatLngList});

  final String date;
  final List<StationLatLng> stationLatLngList;

  @override
  State<DummyAlert> createState() => _DummyAlertState();
}

class _DummyAlertState extends State<DummyAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.date),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.stationLatLngList.map(
                (StationLatLng e) {
                  return Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(e.stationName),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(e.lat),
                            Text(e.lng),
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
}
