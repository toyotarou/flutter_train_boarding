import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_param/app_param.dart';
import 'bus_stop_address/bus_stop_address.dart';
import 'dup_spot/dup_spot.dart';
import 'geoloc/geoloc.dart';
import 'station/station.dart';
import 'train/train.dart';
import 'train_boarding/train_boarding.dart';

mixin ControllersMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  //==========================================//

  AppParamState get appParamState => ref.watch(appParamControllerProvider);

  AppParamController get appParamNotifier => ref.read(appParamControllerProvider.notifier);

  //==========================================//

  TrainBoardingState get trainBoardingState => ref.watch(trainBoardingControllerProvider);

  TrainBoardingController get trainBoardingNotifier => ref.read(trainBoardingControllerProvider.notifier);

//==========================================//

  StationState get stationState => ref.watch(stationControllerProvider);

  StationController get stationNotifier => ref.read(stationControllerProvider.notifier);

//==========================================//

  TrainState get trainState => ref.watch(trainControllerProvider);

  TrainController get trainNotifier => ref.read(trainControllerProvider.notifier);

//==========================================//

  GeolocControllerState get geolocState => ref.watch(geolocControllerProvider);

  GeolocController get geolocNotifier => ref.read(geolocControllerProvider.notifier);

//==========================================//

  BusStopAddressState get busStopAddressState => ref.watch(busStopAddressControllerProvider);

  BusStopAddressController get busStopAddressNotifier => ref.read(busStopAddressControllerProvider.notifier);

//==========================================//

  DupSpotState get dupSpotState => ref.watch(dupSpotControllerProvider);

  DupSpotController get dupSpotNotifier => ref.read(dupSpotControllerProvider.notifier);

//==========================================//
}
