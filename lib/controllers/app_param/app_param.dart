import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_param.freezed.dart';

part 'app_param.g.dart';

@freezed
class AppParamState with _$AppParamState {
  const factory AppParamState({
    @Default('-') String selectedYear,
    @Default(0) int selectedStartHome,
  }) = _AppParamState;
}

@Riverpod(keepAlive: true)
class AppParamController extends _$AppParamController {
  ///
  @override
  AppParamState build() => const AppParamState();

  ///
  void setSelectedYear({required String year}) => state = state.copyWith(selectedYear: year);

  ///
  void setSelectedStartHome({required int num}) => state = state.copyWith(selectedStartHome: num);
}
