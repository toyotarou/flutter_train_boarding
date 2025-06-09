// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_stop_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BusStopAddressState {
  Map<String, BusStopAddressModel> get busStopAddressMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of BusStopAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusStopAddressStateCopyWith<BusStopAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusStopAddressStateCopyWith<$Res> {
  factory $BusStopAddressStateCopyWith(
          BusStopAddressState value, $Res Function(BusStopAddressState) then) =
      _$BusStopAddressStateCopyWithImpl<$Res, BusStopAddressState>;
  @useResult
  $Res call({Map<String, BusStopAddressModel> busStopAddressMap});
}

/// @nodoc
class _$BusStopAddressStateCopyWithImpl<$Res, $Val extends BusStopAddressState>
    implements $BusStopAddressStateCopyWith<$Res> {
  _$BusStopAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusStopAddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? busStopAddressMap = null,
  }) {
    return _then(_value.copyWith(
      busStopAddressMap: null == busStopAddressMap
          ? _value.busStopAddressMap
          : busStopAddressMap // ignore: cast_nullable_to_non_nullable
              as Map<String, BusStopAddressModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusStopAddressStateImplCopyWith<$Res>
    implements $BusStopAddressStateCopyWith<$Res> {
  factory _$$BusStopAddressStateImplCopyWith(_$BusStopAddressStateImpl value,
          $Res Function(_$BusStopAddressStateImpl) then) =
      __$$BusStopAddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, BusStopAddressModel> busStopAddressMap});
}

/// @nodoc
class __$$BusStopAddressStateImplCopyWithImpl<$Res>
    extends _$BusStopAddressStateCopyWithImpl<$Res, _$BusStopAddressStateImpl>
    implements _$$BusStopAddressStateImplCopyWith<$Res> {
  __$$BusStopAddressStateImplCopyWithImpl(_$BusStopAddressStateImpl _value,
      $Res Function(_$BusStopAddressStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusStopAddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? busStopAddressMap = null,
  }) {
    return _then(_$BusStopAddressStateImpl(
      busStopAddressMap: null == busStopAddressMap
          ? _value._busStopAddressMap
          : busStopAddressMap // ignore: cast_nullable_to_non_nullable
              as Map<String, BusStopAddressModel>,
    ));
  }
}

/// @nodoc

class _$BusStopAddressStateImpl implements _BusStopAddressState {
  const _$BusStopAddressStateImpl(
      {final Map<String, BusStopAddressModel> busStopAddressMap =
          const <String, BusStopAddressModel>{}})
      : _busStopAddressMap = busStopAddressMap;

  final Map<String, BusStopAddressModel> _busStopAddressMap;
  @override
  @JsonKey()
  Map<String, BusStopAddressModel> get busStopAddressMap {
    if (_busStopAddressMap is EqualUnmodifiableMapView)
      return _busStopAddressMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_busStopAddressMap);
  }

  @override
  String toString() {
    return 'BusStopAddressState(busStopAddressMap: $busStopAddressMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusStopAddressStateImpl &&
            const DeepCollectionEquality()
                .equals(other._busStopAddressMap, _busStopAddressMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_busStopAddressMap));

  /// Create a copy of BusStopAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusStopAddressStateImplCopyWith<_$BusStopAddressStateImpl> get copyWith =>
      __$$BusStopAddressStateImplCopyWithImpl<_$BusStopAddressStateImpl>(
          this, _$identity);
}

abstract class _BusStopAddressState implements BusStopAddressState {
  const factory _BusStopAddressState(
          {final Map<String, BusStopAddressModel> busStopAddressMap}) =
      _$BusStopAddressStateImpl;

  @override
  Map<String, BusStopAddressModel> get busStopAddressMap;

  /// Create a copy of BusStopAddressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusStopAddressStateImplCopyWith<_$BusStopAddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
