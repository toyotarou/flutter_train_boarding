import 'package:flutter/material.dart';

import '../../models/station.dart';

class DummyAlert extends StatefulWidget {
  const DummyAlert({super.key, required this.data});

  final Map<String, StationModel> data;

  @override
  State<DummyAlert> createState() => _DummyAlertState();
}

class _DummyAlertState extends State<DummyAlert> {
  ///
  @override
  Widget build(BuildContext context) {
    checkDuplicateStationName();

    return const Placeholder();
  }

  ///
  void checkDuplicateStationName() {
    final Map<String, Map<String, StationModel>> map = <String, Map<String, StationModel>>{};

    widget.data.forEach((String key, StationModel value) {
      final List<String> exKey = key.split('|');

      map[exKey[0]] = <String, StationModel>{};
    });

    widget.data.forEach((String key, StationModel value) {
      final List<String> exKey = key.split('|');

      map[exKey[0]]?[exKey[1]] = value;
    });

    //
    // print(widget.data);
    //

    map.forEach((String key, Map<String, StationModel> value) {
      if (value.length > 1) {
        print(key);
        print(value);
      }
    });
  }
}
