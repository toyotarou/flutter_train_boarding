// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geoloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeolocControllerState {
  List<GeolocModel> get allGeolocList => throw _privateConstructorUsedError;
  Map<String, List<GeolocModel>> get allGeolocMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of GeolocControllerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeolocControllerStateCopyWith<GeolocControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeolocControllerStateCopyWith<$Res> {
  factory $GeolocControllerStateCopyWith(GeolocControllerState value,
          $Res Function(GeolocControllerState) then) =
      _$GeolocControllerStateCopyWithImpl<$Res, GeolocControllerState>;
  @useResult
  $Res call(
      {List<GeolocModel> allGeolocList,
      Map<String, List<GeolocModel>> allGeolocMap});
}

/// @nodoc
class _$GeolocControllerStateCopyWithImpl<$Res,
        $Val extends GeolocControllerState>
    implements $GeolocControllerStateCopyWith<$Res> {
  _$GeolocControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeolocControllerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allGeolocList = null,
    Object? allGeolocMap = null,
  }) {
    return _then(_value.copyWith(
      allGeolocList: null == allGeolocList
          ? _value.allGeolocList
          : allGeolocList // ignore: cast_nullable_to_non_nullable
              as List<GeolocModel>,
      allGeolocMap: null == allGeolocMap
          ? _value.allGeolocMap
          : allGeolocMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<GeolocModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeolocControllerStateImplCopyWith<$Res>
    implements $GeolocControllerStateCopyWith<$Res> {
  factory _$$GeolocControllerStateImplCopyWith(
          _$GeolocControllerStateImpl value,
          $Res Function(_$GeolocControllerStateImpl) then) =
      __$$GeolocControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GeolocModel> allGeolocList,
      Map<String, List<GeolocModel>> allGeolocMap});
}

/// @nodoc
class __$$GeolocControllerStateImplCopyWithImpl<$Res>
    extends _$GeolocControllerStateCopyWithImpl<$Res,
        _$GeolocControllerStateImpl>
    implements _$$GeolocControllerStateImplCopyWith<$Res> {
  __$$GeolocControllerStateImplCopyWithImpl(_$GeolocControllerStateImpl _value,
      $Res Function(_$GeolocControllerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeolocControllerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allGeolocList = null,
    Object? allGeolocMap = null,
  }) {
    return _then(_$GeolocControllerStateImpl(
      allGeolocList: null == allGeolocList
          ? _value._allGeolocList
          : allGeolocList // ignore: cast_nullable_to_non_nullable
              as List<GeolocModel>,
      allGeolocMap: null == allGeolocMap
          ? _value._allGeolocMap
          : allGeolocMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<GeolocModel>>,
    ));
  }
}

/// @nodoc

class _$GeolocControllerStateImpl implements _GeolocControllerState {
  const _$GeolocControllerStateImpl(
      {final List<GeolocModel> allGeolocList = const <GeolocModel>[],
      final Map<String, List<GeolocModel>> allGeolocMap =
          const <String, List<GeolocModel>>{}})
      : _allGeolocList = allGeolocList,
        _allGeolocMap = allGeolocMap;

  final List<GeolocModel> _allGeolocList;
  @override
  @JsonKey()
  List<GeolocModel> get allGeolocList {
    if (_allGeolocList is EqualUnmodifiableListView) return _allGeolocList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allGeolocList);
  }

  final Map<String, List<GeolocModel>> _allGeolocMap;
  @override
  @JsonKey()
  Map<String, List<GeolocModel>> get allGeolocMap {
    if (_allGeolocMap is EqualUnmodifiableMapView) return _allGeolocMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_allGeolocMap);
  }

  @override
  String toString() {
    return 'GeolocControllerState(allGeolocList: $allGeolocList, allGeolocMap: $allGeolocMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeolocControllerStateImpl &&
            const DeepCollectionEquality()
                .equals(other._allGeolocList, _allGeolocList) &&
            const DeepCollectionEquality()
                .equals(other._allGeolocMap, _allGeolocMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allGeolocList),
      const DeepCollectionEquality().hash(_allGeolocMap));

  /// Create a copy of GeolocControllerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeolocControllerStateImplCopyWith<_$GeolocControllerStateImpl>
      get copyWith => __$$GeolocControllerStateImplCopyWithImpl<
          _$GeolocControllerStateImpl>(this, _$identity);
}

abstract class _GeolocControllerState implements GeolocControllerState {
  const factory _GeolocControllerState(
          {final List<GeolocModel> allGeolocList,
          final Map<String, List<GeolocModel>> allGeolocMap}) =
      _$GeolocControllerStateImpl;

  @override
  List<GeolocModel> get allGeolocList;
  @override
  Map<String, List<GeolocModel>> get allGeolocMap;

  /// Create a copy of GeolocControllerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeolocControllerStateImplCopyWith<_$GeolocControllerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
