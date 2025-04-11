import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../extensions/extensions.dart';
import '../../models/train.dart';
import '../../utility/utility.dart';

part 'train.freezed.dart';

part 'train.g.dart';

@freezed
class TrainState with _$TrainState {
  const factory TrainState({
    @Default(<String, TrainModel>{}) Map<String, TrainModel> trainModelMap,
  }) = _TrainState;
}

@Riverpod(keepAlive: true)
class TrainController extends _$TrainController {
  final Utility utility = Utility();

  ///
  @override
  TrainState build() => const TrainState();

//============================================== api

  ///
  Future<TrainState> fetchAllTrain() async {
    final HttpClient client = ref.read(httpClientProvider);

    try {
      final dynamic value = await client.getByPath(path: 'http://49.212.175.205:3000/api/v1/train');

      final Map<String, TrainModel> map = <String, TrainModel>{};

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value.length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final TrainModel val = TrainModel.fromJson(value[i] as Map<String, dynamic>);

        map[val.trainNumber] = val;
      }

      return state.copyWith(trainModelMap: map);
    } catch (e) {
      utility.showError('予期せぬエラーが発生しました');
      rethrow; // これにより呼び出し元でキャッチできる
    }
  }

  ///
  Future<void> getAllTrain() async {
    try {
      final TrainState newState = await fetchAllTrain();

      state = newState;
    } catch (_) {}
  }

//============================================== api
}
