import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

import '../../const/const.dart';
import '../../controllers/controllers_mixin.dart';
import '../../extensions/extensions.dart';
import '../../models/geoloc.dart';
import '../../models/station_lat_lng.dart';
import '../../service/numbered_polylines_service.dart';
import '../../service/route_pairing_service.dart';
import '../../utility/tile_provider.dart';
import '../../utility/utility.dart';
import '../parts/train_boarding_dialog.dart';
import 'polyline_station_info_alert.dart';

class TrainBoardingMapAlert extends ConsumerStatefulWidget {
  const TrainBoardingMapAlert({
    super.key,
    required this.stationLatLngDateList,
    required this.date,
  });

  final String date;
  final List<List<StationLatLng>> stationLatLngDateList;

  @override
  ConsumerState<TrainBoardingMapAlert> createState() => _TrainBoardingMapAlertState();
}

class _TrainBoardingMapAlertState extends ConsumerState<TrainBoardingMapAlert>
    with ControllersMixin<TrainBoardingMapAlert> {
  late PairingResult pairingResult;

  List<List<StationLatLng>> polylineSourceList = <List<StationLatLng>>[];

  final MapController mapController = MapController();

  static final List<Color> _polylineColors = <Color>[
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  List<double> latList = <double>[];
  List<double> lngList = <double>[];

  double minLat = 0.0;
  double maxLat = 0.0;
  double minLng = 0.0;
  double maxLng = 0.0;

  double? currentZoom;

  List<int> soeji0List = <int>[];
  List<int> soeji1List = <int>[];

  Utility utility = Utility();

  double dist0 = 0.0;

  double dist1 = 0.0;

  List<Marker> markerList = <Marker>[];

  ///
  @override
  void initState() {
    super.initState();

    pairingResult = RoutePairingService.pairRoutes(widget.stationLatLngDateList);

    /////////////////////////////////////

    StationLatLng lastStationLatLng = StationLatLng(stationName: '', lat: '', lng: '');

    for (final List<StationLatLng> element in widget.stationLatLngDateList) {
      for (final StationLatLng element2 in element) {
        lastStationLatLng = element2;
      }
    }

    // ignore: always_specify_types
    Future(() {
      dist0 = utility.calculateDistance(
        LatLng(lastStationLatLng.lat.toDouble(), lastStationLatLng.lng.toDouble()),
        const LatLng(funabashiLat, funabashiLng),
      );

      dist1 = utility.calculateDistance(
        LatLng(lastStationLatLng.lat.toDouble(), lastStationLatLng.lng.toDouble()),
        const LatLng(zenpukujiLat, zenpukujiLng),
      );

      if (dist0 < dist1) {
        appParamNotifier.setSelectedStartHome(num: 0);
      } else {
        appParamNotifier.setSelectedStartHome(num: 1);
      }
    });

    /////////////////////////////////////
  }

  ///
  @override
  Widget build(BuildContext context) {
    soeji0List = <int>[];
    soeji1List = <int>[];

    if (pairingResult.pairs.isNotEmpty) {
      soeji0List = pairingResult.pairs.map((List<int> subList) => subList[0]).toList();
      soeji1List = pairingResult.pairs.map((List<int> subList) => subList[1]).toList();
    }

    polylineSourceList = widget.stationLatLngDateList
        .asMap()
        .entries
        .where((MapEntry<int, List<StationLatLng>> entry) => !soeji1List.contains(entry.key))
        .map((MapEntry<int, List<StationLatLng>> entry) => entry.value)
        .toList();

    makeMinMaxLatLng();

    makeGeolocMarkers();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            FlutterMap(
              mapController: mapController,
              options: const MapOptions(initialCenter: LatLng(zenpukujiLat, zenpukujiLng), initialZoom: 11),
              children: <Widget>[
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  tileProvider: CachedTileProvider(),
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(markers: markerList),
                NumberedPolylinesWidget(
                  polylines: polylineSourceList,
                  colors: _polylineColors,
                  onMarkerTap: _onMarkerTap,
                  soeji0List: soeji0List,
                ),
              ],
            ),
            DefaultTextStyle(
              style: const TextStyle(color: Colors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.date),
                  Text('root num : ${widget.stationLatLngDateList.length}'),
                  Divider(
                    color: Colors.white.withOpacity(0.3),
                    thickness: 5,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: polylineSourceList.asMap().entries.map(
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
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    setDefaultBoundsMap();
                  },
                  icon: const Icon(FontAwesomeIcons.expand, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///
  void _onMarkerTap(int index) {
    mapController.rotate(0);

    final List<StationLatLng> stations = polylineSourceList[index];

    TrainBoardingDialog(
      context: context,
      widget: PolylineStationInfoAlert(
        index: index,
        stations: stations,
        soeji0List: soeji0List,
        stationNameTrainNumberMap: stationState.stationNameTrainNumberMap,
        geolocModelList: geolocState.allGeolocMap[widget.date] ?? <GeolocModel>[],
      ),
      paddingTop: context.screenSize.height * 0.6,
      clearBarrierColor: true,
    );
  }

  ///
  void makeMinMaxLatLng() {
    latList = <double>[];
    lngList = <double>[];

    if (appParamState.selectedStartHome == 0) {
      latList.add(funabashiLat);
      lngList.add(funabashiLng);
    }

    if (appParamState.selectedStartHome == 1) {
      latList.add(zenpukujiLat);
      lngList.add(zenpukujiLng);
    }

    for (final List<StationLatLng> element in widget.stationLatLngDateList) {
      for (final StationLatLng element2 in element) {
        latList.add(element2.lat.toDouble());
        lngList.add(element2.lng.toDouble());
      }
    }

    if (latList.isNotEmpty && lngList.isNotEmpty) {
      minLat = latList.reduce(min);
      maxLat = latList.reduce(max);
      minLng = lngList.reduce(min);
      maxLng = lngList.reduce(max);
    }
  }

  ///
  void setDefaultBoundsMap() {
    final LatLngBounds bounds = LatLngBounds.fromPoints(<LatLng>[LatLng(minLat, maxLng), LatLng(maxLat, minLng)]);

    final CameraFit cameraFit =
        CameraFit.bounds(bounds: bounds, padding: EdgeInsets.all(appParamState.currentPaddingIndex * 10));

    mapController.fitCamera(cameraFit);

    /// これは残しておく
    // final LatLng newCenter = mapController.camera.center;

    final double newZoom = mapController.camera.zoom;

    setState(() => currentZoom = newZoom);

    appParamNotifier.setCurrentZoom(zoom: newZoom);
    // }
  }

  ///
  void makeGeolocMarkers() {
    markerList = <Marker>[];

    final List<GeolocModel>? dateGeoloc = geolocState.allGeolocMap[widget.date];

    if (dateGeoloc != null) {
      for (final GeolocModel element in dateGeoloc) {
        markerList.add(
          Marker(
            point: LatLng(element.latitude.toDouble(), element.longitude.toDouble()),
            width: 40,
            height: 40,
            child: const Icon(Icons.ac_unit, size: 20, color: Colors.black),
          ),
        );
      }
    }
  }
}
