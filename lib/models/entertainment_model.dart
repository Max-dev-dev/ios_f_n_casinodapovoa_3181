// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'entertainment_model.freezed.dart';
part 'entertainment_model.g.dart';

@freezed
class Entertainment with _$Entertainment {
  factory Entertainment({
    required Category water,
    required Category restaurants,
    required Category festival,
    required Category others,
  }) = _Entertainment;

  factory Entertainment.fromJson(Map<String, dynamic> json) => _$EntertainmentFromJson(json);
}

@freezed
class Category with _$Category {
  factory Category({
    required List<EntrItem> items,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
class EntrItem with _$EntrItem {
  factory EntrItem({
    required String title,
    required String description,
    required String image,
  }) = _EntrItem;

  factory EntrItem.fromJson(Map<String, dynamic> json) => _$EntrItemFromJson(json);
}
