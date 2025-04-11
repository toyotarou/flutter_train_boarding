import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extensions/extensions.dart';
import '../../models/station_lat_lng.dart';

class PolylineStationInfoAlert extends StatefulWidget {
  const PolylineStationInfoAlert(
      {super.key,
      required this.stations,
      required this.index,
      required this.soeji0List,
      required this.stationNameIdMap,
      required this.trainNumberStationIdMap});

  final int index;
  final List<StationLatLng> stations;
  final List<int> soeji0List;
  final Map<String, List<int>> stationNameIdMap;
  final Map<String, List<int>> trainNumberStationIdMap;

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
            if (widget.soeji0List.contains(widget.index)) ...<Widget>[
              const SizedBox(height: 10),
              const Text('往復', style: TextStyle(color: Colors.yellowAccent, fontSize: 20)),
              const SizedBox(height: 10),
            ],
            displayPolylineStations(),
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
                if (widget.stationNameIdMap[element.value.stationName] != null) ...<Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.stationNameIdMap[element.value.stationName]!.map(
                      (int e) {
                        return Text(e.toString());
                      },
                    ).toList(),
                  ),
                ],
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
      height: 200,
      child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: list)),
    );
  }
}
