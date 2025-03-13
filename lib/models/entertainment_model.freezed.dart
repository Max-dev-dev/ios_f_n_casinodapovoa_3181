// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entertainment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Entertainment _$EntertainmentFromJson(Map<String, dynamic> json) {
  return _Entertainment.fromJson(json);
}

/// @nodoc
mixin _$Entertainment {
  Category get water => throw _privateConstructorUsedError;
  Category get restaurants => throw _privateConstructorUsedError;
  Category get festival => throw _privateConstructorUsedError;
  Category get others => throw _privateConstructorUsedError;

  /// Serializes this Entertainment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Entertainment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntertainmentCopyWith<Entertainment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntertainmentCopyWith<$Res> {
  factory $EntertainmentCopyWith(
          Entertainment value, $Res Function(Entertainment) then) =
      _$EntertainmentCopyWithImpl<$Res, Entertainment>;
  @useResult
  $Res call(
      {Category water,
      Category restaurants,
      Category festival,
      Category others});

  $CategoryCopyWith<$Res> get water;
  $CategoryCopyWith<$Res> get restaurants;
  $CategoryCopyWith<$Res> get festival;
  $CategoryCopyWith<$Res> get others;
}

/// @nodoc
class _$EntertainmentCopyWithImpl<$Res, $Val extends Entertainment>
    implements $EntertainmentCopyWith<$Res> {
  _$EntertainmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Entertainment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? water = null,
    Object? restaurants = null,
    Object? festival = null,
    Object? others = null,
  }) {
    return _then(_value.copyWith(
      water: null == water
          ? _value.water
          : water // ignore: cast_nullable_to_non_nullable
              as Category,
      restaurants: null == restaurants
          ? _value.restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as Category,
      festival: null == festival
          ? _value.festival
          : festival // ignore: cast_nullable_to_non_nullable
              as Category,
      others: null == others
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as Category,
    ) as $Val);
  }

  /// Create a copy of Entertainment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get water {
    return $CategoryCopyWith<$Res>(_value.water, (value) {
      return _then(_value.copyWith(water: value) as $Val);
    });
  }

  /// Create a copy of Entertainment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get restaurants {
    return $CategoryCopyWith<$Res>(_value.restaurants, (value) {
      return _then(_value.copyWith(restaurants: value) as $Val);
    });
  }

  /// Create a copy of Entertainment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get festival {
    return $CategoryCopyWith<$Res>(_value.festival, (value) {
      return _then(_value.copyWith(festival: value) as $Val);
    });
  }

  /// Create a copy of Entertainment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get others {
    return $CategoryCopyWith<$Res>(_value.others, (value) {
      return _then(_value.copyWith(others: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EntertainmentImplCopyWith<$Res>
    implements $EntertainmentCopyWith<$Res> {
  factory _$$EntertainmentImplCopyWith(
          _$EntertainmentImpl value, $Res Function(_$EntertainmentImpl) then) =
      __$$EntertainmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Category water,
      Category restaurants,
      Category festival,
      Category others});

  @override
  $CategoryCopyWith<$Res> get water;
  @override
  $CategoryCopyWith<$Res> get restaurants;
  @override
  $CategoryCopyWith<$Res> get festival;
  @override
  $CategoryCopyWith<$Res> get others;
}

/// @nodoc
class __$$EntertainmentImplCopyWithImpl<$Res>
    extends _$EntertainmentCopyWithImpl<$Res, _$EntertainmentImpl>
    implements _$$EntertainmentImplCopyWith<$Res> {
  __$$EntertainmentImplCopyWithImpl(
      _$EntertainmentImpl _value, $Res Function(_$EntertainmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Entertainment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? water = null,
    Object? restaurants = null,
    Object? festival = null,
    Object? others = null,
  }) {
    return _then(_$EntertainmentImpl(
      water: null == water
          ? _value.water
          : water // ignore: cast_nullable_to_non_nullable
              as Category,
      restaurants: null == restaurants
          ? _value.restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as Category,
      festival: null == festival
          ? _value.festival
          : festival // ignore: cast_nullable_to_non_nullable
              as Category,
      others: null == others
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntertainmentImpl implements _Entertainment {
  _$EntertainmentImpl(
      {required this.water,
      required this.restaurants,
      required this.festival,
      required this.others});

  factory _$EntertainmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntertainmentImplFromJson(json);

  @override
  final Category water;
  @override
  final Category restaurants;
  @override
  final Category festival;
  @override
  final Category others;

  @override
  String toString() {
    return 'Entertainment(water: $water, restaurants: $restaurants, festival: $festival, others: $others)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntertainmentImpl &&
            (identical(other.water, water) || other.water == water) &&
            (identical(other.restaurants, restaurants) ||
                other.restaurants == restaurants) &&
            (identical(other.festival, festival) ||
                other.festival == festival) &&
            (identical(other.others, others) || other.others == others));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, water, restaurants, festival, others);

  /// Create a copy of Entertainment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntertainmentImplCopyWith<_$EntertainmentImpl> get copyWith =>
      __$$EntertainmentImplCopyWithImpl<_$EntertainmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntertainmentImplToJson(
      this,
    );
  }
}

abstract class _Entertainment implements Entertainment {
  factory _Entertainment(
      {required final Category water,
      required final Category restaurants,
      required final Category festival,
      required final Category others}) = _$EntertainmentImpl;

  factory _Entertainment.fromJson(Map<String, dynamic> json) =
      _$EntertainmentImpl.fromJson;

  @override
  Category get water;
  @override
  Category get restaurants;
  @override
  Category get festival;
  @override
  Category get others;

  /// Create a copy of Entertainment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntertainmentImplCopyWith<_$EntertainmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  List<EntrItem> get items => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call({List<EntrItem> items});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<EntrItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EntrItem> items});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$CategoryImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<EntrItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  _$CategoryImpl({required final List<EntrItem> items}) : _items = items;

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  final List<EntrItem> _items;
  @override
  List<EntrItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Category(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  factory _Category({required final List<EntrItem> items}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  List<EntrItem> get items;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EntrItem _$EntrItemFromJson(Map<String, dynamic> json) {
  return _EntrItem.fromJson(json);
}

/// @nodoc
mixin _$EntrItem {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Serializes this EntrItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EntrItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntrItemCopyWith<EntrItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntrItemCopyWith<$Res> {
  factory $EntrItemCopyWith(EntrItem value, $Res Function(EntrItem) then) =
      _$EntrItemCopyWithImpl<$Res, EntrItem>;
  @useResult
  $Res call({String title, String description, String image});
}

/// @nodoc
class _$EntrItemCopyWithImpl<$Res, $Val extends EntrItem>
    implements $EntrItemCopyWith<$Res> {
  _$EntrItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EntrItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? image = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntrItemImplCopyWith<$Res>
    implements $EntrItemCopyWith<$Res> {
  factory _$$EntrItemImplCopyWith(
          _$EntrItemImpl value, $Res Function(_$EntrItemImpl) then) =
      __$$EntrItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, String image});
}

/// @nodoc
class __$$EntrItemImplCopyWithImpl<$Res>
    extends _$EntrItemCopyWithImpl<$Res, _$EntrItemImpl>
    implements _$$EntrItemImplCopyWith<$Res> {
  __$$EntrItemImplCopyWithImpl(
      _$EntrItemImpl _value, $Res Function(_$EntrItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of EntrItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_$EntrItemImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntrItemImpl implements _EntrItem {
  _$EntrItemImpl(
      {required this.title, required this.description, required this.image});

  factory _$EntrItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntrItemImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String image;

  @override
  String toString() {
    return 'EntrItem(title: $title, description: $description, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntrItemImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, image);

  /// Create a copy of EntrItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntrItemImplCopyWith<_$EntrItemImpl> get copyWith =>
      __$$EntrItemImplCopyWithImpl<_$EntrItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntrItemImplToJson(
      this,
    );
  }
}

abstract class _EntrItem implements EntrItem {
  factory _EntrItem(
      {required final String title,
      required final String description,
      required final String image}) = _$EntrItemImpl;

  factory _EntrItem.fromJson(Map<String, dynamic> json) =
      _$EntrItemImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get image;

  /// Create a copy of EntrItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntrItemImplCopyWith<_$EntrItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
