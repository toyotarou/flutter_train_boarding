import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../extensions/extensions.dart';
import '../../models/dup_spot_model.dart';
import '../../utility/utility.dart';

part 'dup_spot.freezed.dart';

part 'dup_spot.g.dart';

@freezed
class DupSpotState with _$DupSpotState {
  const factory DupSpotState({
    @Default(<String, DupSpotModel>{}) Map<String, DupSpotModel> dupSpotMap,
  }) = _DupSpotState;
}

@Riverpod(keepAlive: true)
class DupSpotController extends _$DupSpotController {
  final Utility utility = Utility();

  ///
  @override
  DupSpotState build() => const DupSpotState();

  //============================================== api

  ///
  Future<DupSpotState> fetchAllDupSpot() async {
    final HttpClient client = ref.read(httpClientProvider);

    try {
      final dynamic value = await client.postByPath(path: 'http://toyohide.work/BrainLog/api/getDupSpot');

      final Map<String, DupSpotModel> map = <String, DupSpotModel>{};

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value['data'].length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final DupSpotModel val = DupSpotModel.fromJson(value['data'][i] as Map<String, dynamic>);

        map[val.name] = val;
      }

      return state.copyWith(dupSpotMap: map);
    } catch (e) {
      utility.showError('予期せぬエラーが発生しました');
      rethrow; // これにより呼び出し元でキャッチできる
    }
  }

  ///
  Future<void> getAllDupSpot() async {
    try {
      final DupSpotState newState = await fetchAllDupSpot();

      state = newState;
    } catch (_) {}
  }

//============================================== api
}
