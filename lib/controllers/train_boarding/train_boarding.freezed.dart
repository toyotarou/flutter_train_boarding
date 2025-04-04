// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'train_boarding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrainBoardingState {
  Map<String, TrainBoardingModel> get trainBoardingDateMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of TrainBoardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainBoardingStateCopyWith<TrainBoardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainBoardingStateCopyWith<$Res> {
  factory $TrainBoardingStateCopyWith(
          TrainBoardingState value, $Res Function(TrainBoardingState) then) =
      _$TrainBoardingStateCopyWithImpl<$Res, TrainBoardingState>;
  @useResult
  $Res call({Map<String, TrainBoardingModel> trainBoardingDateMap});
}

/// @nodoc
class _$TrainBoardingStateCopyWithImpl<$Res, $Val extends TrainBoardingState>
    implements $TrainBoardingStateCopyWith<$Res> {
  _$TrainBoardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrainBoardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainBoardingDateMap = null,
  }) {
    return _then(_value.copyWith(
      trainBoardingDateMap: null == trainBoardingDateMap
          ? _value.trainBoardingDateMap
          : trainBoardingDateMap // ignore: cast_nullable_to_non_nullable
              as Map<String, TrainBoardingModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrainBoardingStateImplCopyWith<$Res>
    implements $TrainBoardingStateCopyWith<$Res> {
  factory _$$TrainBoardingStateImplCopyWith(_$TrainBoardingStateImpl value,
          $Res Function(_$TrainBoardingStateImpl) then) =
      __$$TrainBoardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, TrainBoardingModel> trainBoardingDateMap});
}

/// @nodoc
class __$$TrainBoardingStateImplCopyWithImpl<$Res>
    extends _$TrainBoardingStateCopyWithImpl<$Res, _$TrainBoardingStateImpl>
    implements _$$TrainBoardingStateImplCopyWith<$Res> {
  __$$TrainBoardingStateImplCopyWithImpl(_$TrainBoardingStateImpl _value,
      $Res Function(_$TrainBoardingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrainBoardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainBoardingDateMap = null,
  }) {
    return _then(_$TrainBoardingStateImpl(
      trainBoardingDateMap: null == trainBoardingDateMap
          ? _value._trainBoardingDateMap
          : trainBoardingDateMap // ignore: cast_nullable_to_non_nullable
              as Map<String, TrainBoardingModel>,
    ));
  }
}

/// @nodoc

class _$TrainBoardingStateImpl implements _TrainBoardingState {
  const _$TrainBoardingStateImpl(
      {final Map<String, TrainBoardingModel> trainBoardingDateMap =
          const <String, TrainBoardingModel>{}})
      : _trainBoardingDateMap = trainBoardingDateMap;

  final Map<String, TrainBoardingModel> _trainBoardingDateMap;
  @override
  @JsonKey()
  Map<String, TrainBoardingModel> get trainBoardingDateMap {
    if (_trainBoardingDateMap is EqualUnmodifiableMapView)
      return _trainBoardingDateMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_trainBoardingDateMap);
  }

  @override
  String toString() {
    return 'TrainBoardingState(trainBoardingDateMap: $trainBoardingDateMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainBoardingStateImpl &&
            const DeepCollectionEquality()
                .equals(other._trainBoardingDateMap, _trainBoardingDateMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_trainBoardingDateMap));

  /// Create a copy of TrainBoardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainBoardingStateImplCopyWith<_$TrainBoardingStateImpl> get copyWith =>
      __$$TrainBoardingStateImplCopyWithImpl<_$TrainBoardingStateImpl>(
          this, _$identity);
}

abstract class _TrainBoardingState implements TrainBoardingState {
  const factory _TrainBoardingState(
          {final Map<String, TrainBoardingModel> trainBoardingDateMap}) =
      _$TrainBoardingStateImpl;

  @override
  Map<String, TrainBoardingModel> get trainBoardingDateMap;

  /// Create a copy of TrainBoardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainBoardingStateImplCopyWith<_$TrainBoardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
