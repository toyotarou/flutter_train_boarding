import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GeolocTimeDisplayAlert extends ConsumerStatefulWidget {
  const GeolocTimeDisplayAlert({super.key, required this.geolocTimeList});

  final List<String> geolocTimeList;

  @override
  ConsumerState<GeolocTimeDisplayAlert> createState() => _GeolocTimeDisplayAlertState();
}

class _GeolocTimeDisplayAlertState extends ConsumerState<GeolocTimeDisplayAlert> {
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.geolocTimeList.map(
              (String e) {
                return Text(e);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
