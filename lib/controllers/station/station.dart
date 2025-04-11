import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../extensions/extensions.dart';
import '../../models/station.dart';
import '../../utility/utility.dart';
import '../train_boarding/train_boarding.dart';

part 'station.freezed.dart';

part 'station.g.dart';

@freezed
class StationState with _$StationState {
  const factory StationState({
    @Default(<String, StationModel>{}) Map<String, StationModel> stationNameMap,
    @Default(<String, List<int>>{}) Map<String, List<int>> stationNameIdMap,
    @Default(<String, List<int>>{}) Map<String, List<int>> trainNumberStationIdMap,
  }) = _StationState;
}

@Riverpod(keepAlive: true)
class StationController extends _$StationController {
  final Utility utility = Utility();

  ///
  @override
  StationState build() {
    ref.read(trainBoardingControllerProvider.notifier).getAllTrainBoarding();

    return const StationState();
  }

//============================================== api

  ///
  Future<StationState> fetchAllStation() async {
    final HttpClient client = ref.read(httpClientProvider);

    try {
      final dynamic value = await client.getByPath(path: 'http://49.212.175.205:3000/api/v1/station');

      final Map<String, StationModel> map = <String, StationModel>{};

      final Map<String, Map<String, String>> duplicationStationDecisionMap = utility.getDuplicationStationDecisionMap();

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value.length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final StationModel val = StationModel.fromJson(value[i] as Map<String, dynamic>);

        if (duplicationStationDecisionMap[val.stationName] != null) {
          if (duplicationStationDecisionMap[val.stationName]?[val.prefecture] == null) {
            continue;
          }
        }

        map[val.stationName] = val;
      }

      final Map<String, List<int>> map2 = <String, List<int>>{};
      final Map<String, List<int>> map3 = <String, List<int>>{};

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value.length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final StationModel val = StationModel.fromJson(value[i] as Map<String, dynamic>);

        map2[val.stationName] = <int>[];
        map3[val.trainNumber] = <int>[];
      }

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value.length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final StationModel val = StationModel.fromJson(value[i] as Map<String, dynamic>);

        map2[val.stationName]?.add(val.id);
        map3[val.trainNumber]?.add(val.id);
      }

      return state.copyWith(stationNameMap: map, stationNameIdMap: map2, trainNumberStationIdMap: map3);
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
