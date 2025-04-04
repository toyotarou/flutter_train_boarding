import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'station/station.dart';
import 'train_boarding/train_boarding.dart';

mixin ControllersMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  //==========================================//

  TrainBoardingState get trainBoardingState => ref.watch(trainBoardingControllerProvider);

  TrainBoardingController get trainBoardingNotifier => ref.read(trainBoardingControllerProvider.notifier);

//==========================================//

  StationState get stationState => ref.watch(stationControllerProvider);

  StationController get stationNotifier => ref.read(stationControllerProvider.notifier);

//==========================================//
}
