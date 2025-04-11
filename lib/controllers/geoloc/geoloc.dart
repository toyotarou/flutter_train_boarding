import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../extensions/extensions.dart';
import '../../models/geoloc.dart';
import '../../utility/utility.dart';

part 'geoloc.freezed.dart';

part 'geoloc.g.dart';

@freezed
class GeolocControllerState with _$GeolocControllerState {
  const factory GeolocControllerState({
    @Default(<GeolocModel>[]) List<GeolocModel> allGeolocList,
    @Default(<String, List<GeolocModel>>{}) Map<String, List<GeolocModel>> allGeolocMap,
  }) = _GeolocControllerState;
}

@Riverpod(keepAlive: true)
class GeolocController extends _$GeolocController {
  final Utility utility = Utility();

  ///
  @override
  GeolocControllerState build() => const GeolocControllerState();

  //---------------------------------------------------------------//

  ///
  Future<GeolocControllerState> _fetchAllGeolocData() async {
    final HttpClient client = ref.read(httpClientProvider);

    try {
      // ignore: always_specify_types
      final dynamic value = await client.getByPath(path: 'http://49.212.175.205:3000/api/v1/geoloc');

      final List<GeolocModel> list = <GeolocModel>[];
      final Map<String, List<GeolocModel>> map = <String, List<GeolocModel>>{};

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value.length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final GeolocModel val = GeolocModel.fromJson(value[i] as Map<String, dynamic>);
        list.add(val);

        map['${val.year}-${val.month}-${val.day}'] = <GeolocModel>[];
      }

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value.length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final GeolocModel val = GeolocModel.fromJson(value[i] as Map<String, dynamic>);
        map['${val.year}-${val.month}-${val.day}']?.add(val);
      }

      return state.copyWith(allGeolocList: list, allGeolocMap: map);
    } catch (e) {
      utility.showError('予期せぬエラーが発生しました');
      rethrow; // これにより呼び出し元でキャッチできる
    }
  }

  ///
  Future<void> getAllGeoloc() async {
    try {
      final GeolocControllerState newState = await _fetchAllGeolocData();

      state = newState;
    } catch (_) {}
  }

//---------------------------------------------------------------//
}
