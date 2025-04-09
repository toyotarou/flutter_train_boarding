// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppParamState {
  String get selectedYear => throw _privateConstructorUsedError;
  int get selectedStartHome => throw _privateConstructorUsedError;
  int get currentPaddingIndex => throw _privateConstructorUsedError;
  double get currentZoom => throw _privateConstructorUsedError;

  /// Create a copy of AppParamState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppParamStateCopyWith<AppParamState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppParamStateCopyWith<$Res> {
  factory $AppParamStateCopyWith(
          AppParamState value, $Res Function(AppParamState) then) =
      _$AppParamStateCopyWithImpl<$Res, AppParamState>;
  @useResult
  $Res call(
      {String selectedYear,
      int selectedStartHome,
      int currentPaddingIndex,
      double currentZoom});
}

/// @nodoc
class _$AppParamStateCopyWithImpl<$Res, $Val extends AppParamState>
    implements $AppParamStateCopyWith<$Res> {
  _$AppParamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppParamState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedYear = null,
    Object? selectedStartHome = null,
    Object? currentPaddingIndex = null,
    Object? currentZoom = null,
  }) {
    return _then(_value.copyWith(
      selectedYear: null == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as String,
      selectedStartHome: null == selectedStartHome
          ? _value.selectedStartHome
          : selectedStartHome // ignore: cast_nullable_to_non_nullable
              as int,
      currentPaddingIndex: null == currentPaddingIndex
          ? _value.currentPaddingIndex
          : currentPaddingIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentZoom: null == currentZoom
          ? _value.currentZoom
          : currentZoom // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppParamStateImplCopyWith<$Res>
    implements $AppParamStateCopyWith<$Res> {
  factory _$$AppParamStateImplCopyWith(
          _$AppParamStateImpl value, $Res Function(_$AppParamStateImpl) then) =
      __$$AppParamStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String selectedYear,
      int selectedStartHome,
      int currentPaddingIndex,
      double currentZoom});
}

/// @nodoc
class __$$AppParamStateImplCopyWithImpl<$Res>
    extends _$AppParamStateCopyWithImpl<$Res, _$AppParamStateImpl>
    implements _$$AppParamStateImplCopyWith<$Res> {
  __$$AppParamStateImplCopyWithImpl(
      _$AppParamStateImpl _value, $Res Function(_$AppParamStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppParamState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedYear = null,
    Object? selectedStartHome = null,
    Object? currentPaddingIndex = null,
    Object? currentZoom = null,
  }) {
    return _then(_$AppParamStateImpl(
      selectedYear: null == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as String,
      selectedStartHome: null == selectedStartHome
          ? _value.selectedStartHome
          : selectedStartHome // ignore: cast_nullable_to_non_nullable
              as int,
      currentPaddingIndex: null == currentPaddingIndex
          ? _value.currentPaddingIndex
          : currentPaddingIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentZoom: null == currentZoom
          ? _value.currentZoom
          : currentZoom // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$AppParamStateImpl implements _AppParamState {
  const _$AppParamStateImpl(
      {this.selectedYear = '-',
      this.selectedStartHome = 0,
      this.currentPaddingIndex = 5,
      this.currentZoom = 0});

  @override
  @JsonKey()
  final String selectedYear;
  @override
  @JsonKey()
  final int selectedStartHome;
  @override
  @JsonKey()
  final int currentPaddingIndex;
  @override
  @JsonKey()
  final double currentZoom;

  @override
  String toString() {
    return 'AppParamState(selectedYear: $selectedYear, selectedStartHome: $selectedStartHome, currentPaddingIndex: $currentPaddingIndex, currentZoom: $currentZoom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppParamStateImpl &&
            (identical(other.selectedYear, selectedYear) ||
                other.selectedYear == selectedYear) &&
            (identical(other.selectedStartHome, selectedStartHome) ||
                other.selectedStartHome == selectedStartHome) &&
            (identical(other.currentPaddingIndex, currentPaddingIndex) ||
                other.currentPaddingIndex == currentPaddingIndex) &&
            (identical(other.currentZoom, currentZoom) ||
                other.currentZoom == currentZoom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedYear, selectedStartHome,
      currentPaddingIndex, currentZoom);

  /// Create a copy of AppParamState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppParamStateImplCopyWith<_$AppParamStateImpl> get copyWith =>
      __$$AppParamStateImplCopyWithImpl<_$AppParamStateImpl>(this, _$identity);
}

abstract class _AppParamState implements AppParamState {
  const factory _AppParamState(
      {final String selectedYear,
      final int selectedStartHome,
      final int currentPaddingIndex,
      final double currentZoom}) = _$AppParamStateImpl;

  @override
  String get selectedYear;
  @override
  int get selectedStartHome;
  @override
  int get currentPaddingIndex;
  @override
  double get currentZoom;

  /// Create a copy of AppParamState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppParamStateImplCopyWith<_$AppParamStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
