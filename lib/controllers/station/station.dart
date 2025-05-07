import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../extensions/extensions.dart';
import '../../models/station.dart';
import '../../supabase/dup_spot/dup_spot_model.dart';
import '../../supabase/dup_spot/dup_spot_repository.dart';
import '../../utility/utility.dart';
import '../train_boarding/train_boarding.dart';

part 'station.freezed.dart';

part 'station.g.dart';

@freezed
class StationState with _$StationState {
  const factory StationState({
    @Default(<String, StationModel>{}) Map<String, StationModel> stationNameMap,
    @Default(<String, List<String>>{}) Map<String, List<String>> stationNameTrainNumberMap,
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

      final Map<String, Map<String, String>> duplicationStationDecisionMap = <String, Map<String, String>>{};

      await DupSpotRepository().getSupabaseDupSpotNameLimit().then((List<DupSpotModel> value) {
        for (final DupSpotModel element in value) {
          duplicationStationDecisionMap[element.name] = <String, String>{element.area: ''};
        }
      });

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

      final Map<String, List<String>> map2 = <String, List<String>>{};

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value.length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final StationModel val = StationModel.fromJson(value[i] as Map<String, dynamic>);

        map2[val.stationName] = <String>[];
      }

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value.length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final StationModel val = StationModel.fromJson(value[i] as Map<String, dynamic>);

        map2[val.stationName]?.add(val.trainNumber);
      }

      return state.copyWith(stationNameMap: map, stationNameTrainNumberMap: map2);
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
