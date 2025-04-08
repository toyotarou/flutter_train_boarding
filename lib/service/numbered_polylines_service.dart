import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../models/station_lat_lng.dart';

class NumberedPolylinesWidget extends StatelessWidget {
  const NumberedPolylinesWidget({
    super.key,
    required this.polylines,
    required this.colors,
    this.onMarkerTap,
    this.lineWidth = 4.0,
    this.textStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
    this.iconSize = 30,
  });

  final List<List<StationLatLng>> polylines;
  final List<Color> colors;
  final void Function(int polylineIndex)? onMarkerTap;
  final double lineWidth;
  final TextStyle textStyle;
  final double iconSize;

  ///
  List<LatLng> _calculateCenters() {
    return polylines.map((List<StationLatLng> pts) {
      final double latSum = pts.map((StationLatLng s) => double.parse(s.lat)).reduce((double a, double b) => a + b);
      final double lngSum = pts.map((StationLatLng s) => double.parse(s.lng)).reduce((double a, double b) => a + b);
      final int count = pts.length;
      return LatLng(latSum / count, lngSum / count);
    }).toList();
  }

  ///
  // ignore: always_specify_types
  List<Polyline> _buildPolylines() {
    return <Polyline<Object>>[
      for (int i = 0; i < polylines.length; i++)
        // ignore: always_specify_types
        Polyline(
          points: polylines[i].map((StationLatLng s) => s.toLatLng).toList(),
          color: colors[i % colors.length],
          strokeWidth: lineWidth,
        ),
    ];
  }

  ///
  List<Marker> _buildNumberMarkers() {
    final List<LatLng> centers = _calculateCenters();
    return <Marker>[
      for (int i = 0; i < centers.length; i++)
        Marker(
          point: centers[i],
          width: 36,
          height: 36,
          child: GestureDetector(
            onTap: () {
              if (onMarkerTap != null) {
                onMarkerTap!(i);
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: colors[i].withOpacity(0.9), shape: BoxShape.circle),
              child: Text('${i + 1}', style: textStyle),
            ),
          ),
        ),
    ];
  }

  ///
  List<Marker> _buildEndpointMarkers() {
    final List<Marker> markers = <Marker>[];
    for (int i = 0; i < polylines.length; i++) {
      final List<StationLatLng> pts = polylines[i];
      if (pts.isEmpty) {
        continue;
      }

      // 終点マーカー
      markers.add(
        Marker(
          point: pts.last.toLatLng,
          width: iconSize,
          height: iconSize,
          child: Icon(Icons.flag, color: colors[i].withOpacity(0.9),size: 40,),
        ),
      );
    }
    return markers;
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // ignore: always_specify_types
        PolylineLayer(polylines: _buildPolylines()),
        MarkerLayer(markers: _buildNumberMarkers()),
        MarkerLayer(markers: _buildEndpointMarkers()),
      ],
    );
  }
}
