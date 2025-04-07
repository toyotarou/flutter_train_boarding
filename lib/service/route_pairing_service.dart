import '../models/station_lat_lng.dart';

class PairingResult {
  const PairingResult(
      {required this.pairs, required this.pairIdOfIndex, required this.unpairedIndexes, required this.unpairedRoutes});

  final List<List<int>> pairs;

  final List<int> pairIdOfIndex;

  final List<int> unpairedIndexes;

  final List<List<StationLatLng>> unpairedRoutes;
}

/////////////////////////////////////////////////////

class RoutePairingService {
  ///
  static String _routeKey(List<StationLatLng> route) {
    final List<String> names = route.map((StationLatLng e) => e.stationName).toList()..sort();
    return names.join('|');
  }

  ///
  static PairingResult pairRoutes(List<List<StationLatLng>> routes) {
    final Map<String, int> waiting = <String, int>{};

    final List<List<int>> pairs = <List<int>>[];

    final List<int> pairIdOfIndex = List<int>.filled(routes.length, -1);

    for (int i = 0; i < routes.length; i++) {
      final String key = _routeKey(routes[i]);

      if (waiting.containsKey(key)) {
        final int j = waiting.remove(key)!;

        final int pairId = pairs.length;

        pairs.add(<int>[j, i]);

        pairIdOfIndex[j] = pairId;

        pairIdOfIndex[i] = pairId;
      } else {
        waiting[key] = i;
      }
    }

    final List<int> unpairedIndexes = waiting.values.toList()..sort();

    final List<List<StationLatLng>> unpairedRoutes = <List<StationLatLng>>[
      for (final int i in unpairedIndexes) routes[i]
    ];

    return PairingResult(
        pairs: pairs, pairIdOfIndex: pairIdOfIndex, unpairedIndexes: unpairedIndexes, unpairedRoutes: unpairedRoutes);
  }
}
