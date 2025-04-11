import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

import '../../controllers/controllers_mixin.dart';
import '../../extensions/extensions.dart';
import '../../models/geoloc.dart';
import '../../models/station_lat_lng.dart';
import '../../utility/utility.dart';
import '../parts/train_boarding_dialog.dart';
import 'geoloc_time_display_alert.dart';

class PolylineStationInfoAlert extends ConsumerStatefulWidget {
  const PolylineStationInfoAlert({
    super.key,
    required this.stations,
    required this.index,
    required this.soeji0List,
    required this.stationNameTrainNumberMap,
    required this.geolocModelList,
  });

  final int index;
  final List<StationLatLng> stations;
  final List<int> soeji0List;
  final Map<String, List<String>> stationNameTrainNumberMap;
  final List<GeolocModel> geolocModelList;

  @override
  ConsumerState<PolylineStationInfoAlert> createState() => _PolylineStationInfoAlertState();
}

class _PolylineStationInfoAlertState extends ConsumerState<PolylineStationInfoAlert>
    with ControllersMixin<PolylineStationInfoAlert> {
  Utility utility = Utility();

  ///
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

    for (int i = 0; i < widget.stations.length; i++) {
      final List<String> geolocTimeList = getGeolocTimeList(station: widget.stations[i]);

      list.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.stations[i].stationName, style: const TextStyle(fontSize: 20)),
                if (geolocTimeList.isNotEmpty) ...<Widget>[
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      TrainBoardingDialog(
                        context: context,
                        widget: GeolocTimeDisplayAlert(geolocTimeList: geolocTimeList),
                        paddingTop: context.screenSize.height * 0.1,
                        paddingBottom: context.screenSize.height * 0.5,
                        paddingLeft: context.screenSize.width * 0.6,
                        clearBarrierColor: true,
                      );
                    },
                    child: Icon(Icons.timer, color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              ],
            ),
            const SizedBox(width: 10),
          ],
        ),
      );

      if (i < widget.stations.length - 1) {
        list.add(
          (flag == 2) ? const Icon(FontAwesomeIcons.arrowRightArrowLeft) : const Icon(FontAwesomeIcons.arrowRight),
        );
      }
    }

    return SizedBox(
      height: 80,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: list)),
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

        String trainNumber = '';

        sntnmBefore?.forEach((String element) {
          sntnmThis?.forEach((String element2) {
            if (element == element2) {
              trainNumber = element;
            }
          });
        });

        trainNumberList.add((trainNumber != '') ? trainNumber : '0');
      }
    }

    //////////////////////////////////////////////////////

    final List<Widget> list = <Widget>[];

    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: trainNumberList.map(
              (String e) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      (e == '0')
                          ? 'バス'
                          : (trainState.trainModelMap[e] == null)
                              ? ''
                              : trainState.trainModelMap[e]!.trainName,
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ),
    );

    return SizedBox(height: 80, child: SingleChildScrollView(child: Column(children: list)));
  }

  ///
  List<String> getGeolocTimeList({required StationLatLng station}) {
    final List<String> distTimeList = <String>[];

    for (final GeolocModel element in widget.geolocModelList) {
      final double dist0 = utility.calculateDistance(
        LatLng(station.lat.toDouble(), station.lng.toDouble()),
        LatLng(element.latitude.toDouble(), element.longitude.toDouble()),
      );

      if (dist0 < 200) {
        distTimeList.add(element.time);
      }
    }

    distTimeList.sort();

    return distTimeList;
  }
}
