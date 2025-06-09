import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../extensions/extensions.dart';
import '../../models/bus_stop_address.dart';
import '../../utility/utility.dart';

part 'bus_stop_address.freezed.dart';

part 'bus_stop_address.g.dart';

@freezed
class BusStopAddressState with _$BusStopAddressState {
  const factory BusStopAddressState({
    @Default(<String, BusStopAddressModel>{}) Map<String, BusStopAddressModel> busStopAddressMap,
  }) = _BusStopAddressState;
}

@Riverpod(keepAlive: true)
class BusStopAddressController extends _$BusStopAddressController {
  final Utility utility = Utility();

  ///
  @override
  BusStopAddressState build() => const BusStopAddressState();

  //============================================== api

  ///
  Future<BusStopAddressState> fetchAllBusStopAddress() async {
    final HttpClient client = ref.read(httpClientProvider);

    try {
      final dynamic value = await client.postByPath(path: 'http://toyohide.work/BrainLog/api/getBusStopAddress');

      final Map<String, BusStopAddressModel> map = <String, BusStopAddressModel>{};

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value['data'].length.toString().toInt(); i++) {
        // ignore: avoid_dynamic_calls
        final BusStopAddressModel val = BusStopAddressModel.fromJson(value['data'][i] as Map<String, dynamic>);

        map[val.name] = val;
      }

      return state.copyWith(busStopAddressMap: map);
    } catch (e) {
      utility.showError('予期せぬエラーが発生しました');
      rethrow; // これにより呼び出し元でキャッチできる
    }
  }

  ///
  Future<void> getAllBusStopAddress() async {
    try {
      final BusStopAddressState newState = await fetchAllBusStopAddress();

      state = newState;
    } catch (_) {}
  }

//============================================== api
}
