import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../extensions/extensions.dart';
import '../../models/train_boarding.dart';
import '../../utility/utility.dart';

part 'train_boarding.freezed.dart';

part 'train_boarding.g.dart';

@freezed
class TrainBoardingState with _$TrainBoardingState {
  const factory TrainBoardingState({
    @Default(<String, TrainBoardingModel>{}) Map<String, TrainBoardingModel> trainBoardingDateMap,
  }) = _TrainBoardingState;
}

@Riverpod(keepAlive: true)
class TrainBoardingController extends _$TrainBoardingController {
  final Utility utility = Utility();

  ///
  @override
  TrainBoardingState build() => const TrainBoardingState();

  //============================================== api

  ///
  Future<TrainBoardingState> fetchAllTrainBoarding() async {
    final HttpClient client = ref.read(httpClientProvider);

    try {
      final dynamic value = await client.postByPath(path: 'http://toyohide.work/BrainLog/api/gettrainrecord');

      final Map<String, TrainBoardingModel> map = <String, TrainBoardingModel>{};

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value['data'].length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final TrainBoardingModel val = TrainBoardingModel.fromJson(value['data'][i] as Map<String, dynamic>);

        map[val.date.yyyymmdd] = val;
      }

      return state.copyWith(trainBoardingDateMap: map);
    } catch (e) {
      utility.showError('予期せぬエラーが発生しました');
      rethrow; // これにより呼び出し元でキャッチできる
    }
  }

  ///
  Future<void> getAllTrainBoarding() async {
    try {
      final TrainBoardingState newState = await fetchAllTrainBoarding();

      state = newState;
    } catch (_) {}
  }

//============================================== api
}
