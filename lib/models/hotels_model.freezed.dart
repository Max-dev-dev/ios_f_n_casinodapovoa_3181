// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotels_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HotelList _$HotelListFromJson(Map<String, dynamic> json) {
  return _HotelList.fromJson(json);
}

/// @nodoc
mixin _$HotelList {
  List<Hotel> get hotels => throw _privateConstructorUsedError;

  /// Serializes this HotelList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HotelList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HotelListCopyWith<HotelList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelListCopyWith<$Res> {
  factory $HotelListCopyWith(HotelList value, $Res Function(HotelList) then) =
      _$HotelListCopyWithImpl<$Res, HotelList>;
  @useResult
  $Res call({List<Hotel> hotels});
}

/// @nodoc
class _$HotelListCopyWithImpl<$Res, $Val extends HotelList>
    implements $HotelListCopyWith<$Res> {
  _$HotelListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HotelList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotels = null,
  }) {
    return _then(_value.copyWith(
      hotels: null == hotels
          ? _value.hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HotelListImplCopyWith<$Res>
    implements $HotelListCopyWith<$Res> {
  factory _$$HotelListImplCopyWith(
          _$HotelListImpl value, $Res Function(_$HotelListImpl) then) =
      __$$HotelListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Hotel> hotels});
}

/// @nodoc
class __$$HotelListImplCopyWithImpl<$Res>
    extends _$HotelListCopyWithImpl<$Res, _$HotelListImpl>
    implements _$$HotelListImplCopyWith<$Res> {
  __$$HotelListImplCopyWithImpl(
      _$HotelListImpl _value, $Res Function(_$HotelListImpl) _then)
      : super(_value, _then);

  /// Create a copy of HotelList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotels = null,
  }) {
    return _then(_$HotelListImpl(
      hotels: null == hotels
          ? _value._hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HotelListImpl implements _HotelList {
  _$HotelListImpl({required final List<Hotel> hotels}) : _hotels = hotels;

  factory _$HotelListImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotelListImplFromJson(json);

  final List<Hotel> _hotels;
  @override
  List<Hotel> get hotels {
    if (_hotels is EqualUnmodifiableListView) return _hotels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hotels);
  }

  @override
  String toString() {
    return 'HotelList(hotels: $hotels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelListImpl &&
            const DeepCollectionEquality().equals(other._hotels, _hotels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_hotels));

  /// Create a copy of HotelList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelListImplCopyWith<_$HotelListImpl> get copyWith =>
      __$$HotelListImplCopyWithImpl<_$HotelListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HotelListImplToJson(
      this,
    );
  }
}

abstract class _HotelList implements HotelList {
  factory _HotelList({required final List<Hotel> hotels}) = _$HotelListImpl;

  factory _HotelList.fromJson(Map<String, dynamic> json) =
      _$HotelListImpl.fromJson;

  @override
  List<Hotel> get hotels;

  /// Create a copy of HotelList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HotelListImplCopyWith<_$HotelListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Hotel _$HotelFromJson(Map<String, dynamic> json) {
  return _Hotel.fromJson(json);
}

/// @nodoc
mixin _$Hotel {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_per_night')
  int get pricePerNight => throw _privateConstructorUsedError;

  /// Serializes this Hotel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Hotel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HotelCopyWith<Hotel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelCopyWith<$Res> {
  factory $HotelCopyWith(Hotel value, $Res Function(Hotel) then) =
      _$HotelCopyWithImpl<$Res, Hotel>;
  @useResult
  $Res call(
      {String title,
      String description,
      String image,
      double rate,
      String street,
      @JsonKey(name: 'price_per_night') int pricePerNight});
}

/// @nodoc
class _$HotelCopyWithImpl<$Res, $Val extends Hotel>
    implements $HotelCopyWith<$Res> {
  _$HotelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hotel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? rate = null,
    Object? street = null,
    Object? pricePerNight = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerNight: null == pricePerNight
          ? _value.pricePerNight
          : pricePerNight // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HotelImplCopyWith<$Res> implements $HotelCopyWith<$Res> {
  factory _$$HotelImplCopyWith(
          _$HotelImpl value, $Res Function(_$HotelImpl) then) =
      __$$HotelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      String image,
      double rate,
      String street,
      @JsonKey(name: 'price_per_night') int pricePerNight});
}

/// @nodoc
class __$$HotelImplCopyWithImpl<$Res>
    extends _$HotelCopyWithImpl<$Res, _$HotelImpl>
    implements _$$HotelImplCopyWith<$Res> {
  __$$HotelImplCopyWithImpl(
      _$HotelImpl _value, $Res Function(_$HotelImpl) _then)
      : super(_value, _then);

  /// Create a copy of Hotel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? rate = null,
    Object? street = null,
    Object? pricePerNight = null,
  }) {
    return _then(_$HotelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      pricePerNight: null == pricePerNight
          ? _value.pricePerNight
          : pricePerNight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HotelImpl implements _Hotel {
  _$HotelImpl(
      {required this.title,
      required this.description,
      required this.image,
      required this.rate,
      required this.street,
      @JsonKey(name: 'price_per_night') required this.pricePerNight});

  factory _$HotelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotelImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String image;
  @override
  final double rate;
  @override
  final String street;
  @override
  @JsonKey(name: 'price_per_night')
  final int pricePerNight;

  @override
  String toString() {
    return 'Hotel(title: $title, description: $description, image: $image, rate: $rate, street: $street, pricePerNight: $pricePerNight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.pricePerNight, pricePerNight) ||
                other.pricePerNight == pricePerNight));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, description, image, rate, street, pricePerNight);

  /// Create a copy of Hotel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelImplCopyWith<_$HotelImpl> get copyWith =>
      __$$HotelImplCopyWithImpl<_$HotelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HotelImplToJson(
      this,
    );
  }
}

abstract class _Hotel implements Hotel {
  factory _Hotel(
          {required final String title,
          required final String description,
          required final String image,
          required final double rate,
          required final String street,
          @JsonKey(name: 'price_per_night') required final int pricePerNight}) =
      _$HotelImpl;

  factory _Hotel.fromJson(Map<String, dynamic> json) = _$HotelImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get image;
  @override
  double get rate;
  @override
  String get street;
  @override
  @JsonKey(name: 'price_per_night')
  int get pricePerNight;

  /// Create a copy of Hotel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HotelImplCopyWith<_$HotelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
