import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../extensions/extensions.dart';
import '../../models/station.dart';
import '../../utility/utility.dart';

part 'station.freezed.dart';

part 'station.g.dart';

@freezed
class StationState with _$StationState {
  const factory StationState({
    @Default(<String, StationModel>{}) Map<String, StationModel> stationNameMap,
    @Default(<String, StationModel>{}) Map<String, StationModel> stationNamePrefectureMap,
  }) = _StationState;
}

@Riverpod(keepAlive: true)
class StationController extends _$StationController {
  final Utility utility = Utility();

  ///
  @override
  StationState build() => const StationState();

//============================================== api

  ///
  Future<StationState> fetchAllStation() async {
    final HttpClient client = ref.read(httpClientProvider);

    try {
      final dynamic value = await client.getByPath(path: 'http://49.212.175.205:3000/api/v1/station');

      final Map<String, StationModel> map = <String, StationModel>{};

      final Map<String, StationModel> map2 = <String, StationModel>{};

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value.length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final StationModel val = StationModel.fromJson(value[i] as Map<String, dynamic>);

        map[val.stationName] = val;

        map2['${val.stationName}|${val.prefecture}'] = val;
      }

      return state.copyWith(stationNameMap: map, stationNamePrefectureMap: map2);
    } catch (e) {
      utility.showError('予期せぬエラーが発生しました');
      rethrow; // これにより呼び出し元でキャッチできる
    }
  }

  ///
  Future<void> getAllStation() async {
    try {
      final StationState newState = await fetchAllStation();

      state = newState;
    } catch (_) {}
  }

//============================================== api
}
