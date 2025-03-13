// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'places_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GuideState {
  List<Guide> get guides => throw _privateConstructorUsedError;
  List<Guide> get favouriteGuides => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  /// Create a copy of GuideState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuideStateCopyWith<GuideState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuideStateCopyWith<$Res> {
  factory $GuideStateCopyWith(
          GuideState value, $Res Function(GuideState) then) =
      _$GuideStateCopyWithImpl<$Res, GuideState>;
  @useResult
  $Res call(
      {List<Guide> guides,
      List<Guide> favouriteGuides,
      bool isLoading,
      String error});
}

/// @nodoc
class _$GuideStateCopyWithImpl<$Res, $Val extends GuideState>
    implements $GuideStateCopyWith<$Res> {
  _$GuideStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuideState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guides = null,
    Object? favouriteGuides = null,
    Object? isLoading = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      guides: null == guides
          ? _value.guides
          : guides // ignore: cast_nullable_to_non_nullable
              as List<Guide>,
      favouriteGuides: null == favouriteGuides
          ? _value.favouriteGuides
          : favouriteGuides // ignore: cast_nullable_to_non_nullable
              as List<Guide>,
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
abstract class _$$GuideStateImplCopyWith<$Res>
    implements $GuideStateCopyWith<$Res> {
  factory _$$GuideStateImplCopyWith(
          _$GuideStateImpl value, $Res Function(_$GuideStateImpl) then) =
      __$$GuideStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Guide> guides,
      List<Guide> favouriteGuides,
      bool isLoading,
      String error});
}

/// @nodoc
class __$$GuideStateImplCopyWithImpl<$Res>
    extends _$GuideStateCopyWithImpl<$Res, _$GuideStateImpl>
    implements _$$GuideStateImplCopyWith<$Res> {
  __$$GuideStateImplCopyWithImpl(
      _$GuideStateImpl _value, $Res Function(_$GuideStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuideState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guides = null,
    Object? favouriteGuides = null,
    Object? isLoading = null,
    Object? error = null,
  }) {
    return _then(_$GuideStateImpl(
      guides: null == guides
          ? _value._guides
          : guides // ignore: cast_nullable_to_non_nullable
              as List<Guide>,
      favouriteGuides: null == favouriteGuides
          ? _value._favouriteGuides
          : favouriteGuides // ignore: cast_nullable_to_non_nullable
              as List<Guide>,
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

class _$GuideStateImpl implements _GuideState {
  const _$GuideStateImpl(
      {final List<Guide> guides = const [],
      final List<Guide> favouriteGuides = const [],
      this.isLoading = false,
      this.error = ''})
      : _guides = guides,
        _favouriteGuides = favouriteGuides;

  final List<Guide> _guides;
  @override
  @JsonKey()
  List<Guide> get guides {
    if (_guides is EqualUnmodifiableListView) return _guides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guides);
  }

  final List<Guide> _favouriteGuides;
  @override
  @JsonKey()
  List<Guide> get favouriteGuides {
    if (_favouriteGuides is EqualUnmodifiableListView) return _favouriteGuides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favouriteGuides);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'GuideState(guides: $guides, favouriteGuides: $favouriteGuides, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuideStateImpl &&
            const DeepCollectionEquality().equals(other._guides, _guides) &&
            const DeepCollectionEquality()
                .equals(other._favouriteGuides, _favouriteGuides) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_guides),
      const DeepCollectionEquality().hash(_favouriteGuides),
      isLoading,
      error);

  /// Create a copy of GuideState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuideStateImplCopyWith<_$GuideStateImpl> get copyWith =>
      __$$GuideStateImplCopyWithImpl<_$GuideStateImpl>(this, _$identity);
}

abstract class _GuideState implements GuideState {
  const factory _GuideState(
      {final List<Guide> guides,
      final List<Guide> favouriteGuides,
      final bool isLoading,
      final String error}) = _$GuideStateImpl;

  @override
  List<Guide> get guides;
  @override
  List<Guide> get favouriteGuides;
  @override
  bool get isLoading;
  @override
  String get error;

  /// Create a copy of GuideState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuideStateImplCopyWith<_$GuideStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
