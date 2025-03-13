// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotels_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HotelState {
  List<Hotel> get hotels => throw _privateConstructorUsedError;
  List<Hotel> get favouriteHotels => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  /// Create a copy of HotelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HotelStateCopyWith<HotelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelStateCopyWith<$Res> {
  factory $HotelStateCopyWith(
          HotelState value, $Res Function(HotelState) then) =
      _$HotelStateCopyWithImpl<$Res, HotelState>;
  @useResult
  $Res call(
      {List<Hotel> hotels,
      List<Hotel> favouriteHotels,
      bool isLoading,
      String error});
}

/// @nodoc
class _$HotelStateCopyWithImpl<$Res, $Val extends HotelState>
    implements $HotelStateCopyWith<$Res> {
  _$HotelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HotelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotels = null,
    Object? favouriteHotels = null,
    Object? isLoading = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      hotels: null == hotels
          ? _value.hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>,
      favouriteHotels: null == favouriteHotels
          ? _value.favouriteHotels
          : favouriteHotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HotelStateImplCopyWith<$Res>
    implements $HotelStateCopyWith<$Res> {
  factory _$$HotelStateImplCopyWith(
          _$HotelStateImpl value, $Res Function(_$HotelStateImpl) then) =
      __$$HotelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Hotel> hotels,
      List<Hotel> favouriteHotels,
      bool isLoading,
      String error});
}

/// @nodoc
class __$$HotelStateImplCopyWithImpl<$Res>
    extends _$HotelStateCopyWithImpl<$Res, _$HotelStateImpl>
    implements _$$HotelStateImplCopyWith<$Res> {
  __$$HotelStateImplCopyWithImpl(
      _$HotelStateImpl _value, $Res Function(_$HotelStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HotelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotels = null,
    Object? favouriteHotels = null,
    Object? isLoading = null,
    Object? error = null,
  }) {
    return _then(_$HotelStateImpl(
      hotels: null == hotels
          ? _value._hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>,
      favouriteHotels: null == favouriteHotels
          ? _value._favouriteHotels
          : favouriteHotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HotelStateImpl implements _HotelState {
  const _$HotelStateImpl(
      {final List<Hotel> hotels = const [],
      final List<Hotel> favouriteHotels = const [],
      this.isLoading = false,
      this.error = ''})
      : _hotels = hotels,
        _favouriteHotels = favouriteHotels;

  final List<Hotel> _hotels;
  @override
  @JsonKey()
  List<Hotel> get hotels {
    if (_hotels is EqualUnmodifiableListView) return _hotels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hotels);
  }

  final List<Hotel> _favouriteHotels;
  @override
  @JsonKey()
  List<Hotel> get favouriteHotels {
    if (_favouriteHotels is EqualUnmodifiableListView) return _favouriteHotels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favouriteHotels);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'HotelState(hotels: $hotels, favouriteHotels: $favouriteHotels, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelStateImpl &&
            const DeepCollectionEquality().equals(other._hotels, _hotels) &&
            const DeepCollectionEquality()
                .equals(other._favouriteHotels, _favouriteHotels) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_hotels),
      const DeepCollectionEquality().hash(_favouriteHotels),
      isLoading,
      error);

  /// Create a copy of HotelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelStateImplCopyWith<_$HotelStateImpl> get copyWith =>
      __$$HotelStateImplCopyWithImpl<_$HotelStateImpl>(this, _$identity);
}

abstract class _HotelState implements HotelState {
  const factory _HotelState(
      {final List<Hotel> hotels,
      final List<Hotel> favouriteHotels,
      final bool isLoading,
      final String error}) = _$HotelStateImpl;

  @override
  List<Hotel> get hotels;
  @override
  List<Hotel> get favouriteHotels;
  @override
  bool get isLoading;
  @override
  String get error;

  /// Create a copy of HotelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HotelStateImplCopyWith<_$HotelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
