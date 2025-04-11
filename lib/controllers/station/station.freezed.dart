// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StationState {
  Map<String, StationModel> get stationNameMap =>
      throw _privateConstructorUsedError;
  Map<String, List<int>> get stationNameIdMap =>
      throw _privateConstructorUsedError;
  Map<String, List<int>> get trainNumberStationIdMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of StationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StationStateCopyWith<StationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationStateCopyWith<$Res> {
  factory $StationStateCopyWith(
          StationState value, $Res Function(StationState) then) =
      _$StationStateCopyWithImpl<$Res, StationState>;
  @useResult
  $Res call(
      {Map<String, StationModel> stationNameMap,
      Map<String, List<int>> stationNameIdMap,
      Map<String, List<int>> trainNumberStationIdMap});
}

/// @nodoc
class _$StationStateCopyWithImpl<$Res, $Val extends StationState>
    implements $StationStateCopyWith<$Res> {
  _$StationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationNameMap = null,
    Object? stationNameIdMap = null,
    Object? trainNumberStationIdMap = null,
  }) {
    return _then(_value.copyWith(
      stationNameMap: null == stationNameMap
          ? _value.stationNameMap
          : stationNameMap // ignore: cast_nullable_to_non_nullable
              as Map<String, StationModel>,
      stationNameIdMap: null == stationNameIdMap
          ? _value.stationNameIdMap
          : stationNameIdMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<int>>,
      trainNumberStationIdMap: null == trainNumberStationIdMap
          ? _value.trainNumberStationIdMap
          : trainNumberStationIdMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<int>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StationStateImplCopyWith<$Res>
    implements $StationStateCopyWith<$Res> {
  factory _$$StationStateImplCopyWith(
          _$StationStateImpl value, $Res Function(_$StationStateImpl) then) =
      __$$StationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, StationModel> stationNameMap,
      Map<String, List<int>> stationNameIdMap,
      Map<String, List<int>> trainNumberStationIdMap});
}

/// @nodoc
class __$$StationStateImplCopyWithImpl<$Res>
    extends _$StationStateCopyWithImpl<$Res, _$StationStateImpl>
    implements _$$StationStateImplCopyWith<$Res> {
  __$$StationStateImplCopyWithImpl(
      _$StationStateImpl _value, $Res Function(_$StationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationNameMap = null,
    Object? stationNameIdMap = null,
    Object? trainNumberStationIdMap = null,
  }) {
    return _then(_$StationStateImpl(
      stationNameMap: null == stationNameMap
          ? _value._stationNameMap
          : stationNameMap // ignore: cast_nullable_to_non_nullable
              as Map<String, StationModel>,
      stationNameIdMap: null == stationNameIdMap
          ? _value._stationNameIdMap
          : stationNameIdMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<int>>,
      trainNumberStationIdMap: null == trainNumberStationIdMap
          ? _value._trainNumberStationIdMap
          : trainNumberStationIdMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<int>>,
    ));
  }
}

/// @nodoc

class _$StationStateImpl implements _StationState {
  const _$StationStateImpl(
      {final Map<String, StationModel> stationNameMap =
          const <String, StationModel>{},
      final Map<String, List<int>> stationNameIdMap =
          const <String, List<int>>{},
      final Map<String, List<int>> trainNumberStationIdMap =
          const <String, List<int>>{}})
      : _stationNameMap = stationNameMap,
        _stationNameIdMap = stationNameIdMap,
        _trainNumberStationIdMap = trainNumberStationIdMap;

  final Map<String, StationModel> _stationNameMap;
  @override
  @JsonKey()
  Map<String, StationModel> get stationNameMap {
    if (_stationNameMap is EqualUnmodifiableMapView) return _stationNameMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stationNameMap);
  }

  final Map<String, List<int>> _stationNameIdMap;
  @override
  @JsonKey()
  Map<String, List<int>> get stationNameIdMap {
    if (_stationNameIdMap is EqualUnmodifiableMapView) return _stationNameIdMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stationNameIdMap);
  }

  final Map<String, List<int>> _trainNumberStationIdMap;
  @override
  @JsonKey()
  Map<String, List<int>> get trainNumberStationIdMap {
    if (_trainNumberStationIdMap is EqualUnmodifiableMapView)
      return _trainNumberStationIdMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_trainNumberStationIdMap);
  }

  @override
  String toString() {
    return 'StationState(stationNameMap: $stationNameMap, stationNameIdMap: $stationNameIdMap, trainNumberStationIdMap: $trainNumberStationIdMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationStateImpl &&
            const DeepCollectionEquality()
                .equals(other._stationNameMap, _stationNameMap) &&
            const DeepCollectionEquality()
                .equals(other._stationNameIdMap, _stationNameIdMap) &&
            const DeepCollectionEquality().equals(
                other._trainNumberStationIdMap, _trainNumberStationIdMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_stationNameMap),
      const DeepCollectionEquality().hash(_stationNameIdMap),
      const DeepCollectionEquality().hash(_trainNumberStationIdMap));

  /// Create a copy of StationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationStateImplCopyWith<_$StationStateImpl> get copyWith =>
      __$$StationStateImplCopyWithImpl<_$StationStateImpl>(this, _$identity);
}

abstract class _StationState implements StationState {
  const factory _StationState(
          {final Map<String, StationModel> stationNameMap,
          final Map<String, List<int>> stationNameIdMap,
          final Map<String, List<int>> trainNumberStationIdMap}) =
      _$StationStateImpl;

  @override
  Map<String, StationModel> get stationNameMap;
  @override
  Map<String, List<int>> get stationNameIdMap;
  @override
  Map<String, List<int>> get trainNumberStationIdMap;

  /// Create a copy of StationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationStateImplCopyWith<_$StationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
