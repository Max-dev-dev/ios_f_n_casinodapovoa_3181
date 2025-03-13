// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'places_model.freezed.dart';
part 'places_model.g.dart';

@freezed
class GuideList with _$GuideList {
  factory GuideList({
    required List<Guide> guides,
  }) = _GuideList;

  factory GuideList.fromJson(Map<String, dynamic> json) => _$GuideListFromJson(json);
}

@freezed
class Guide with _$Guide {
  factory Guide({
    required String name,
    required String description,
    required double rate,
    required String image,
    required Categories categories,
    required List<Review> reviews,
  }) = _Guide;

  factory Guide.fromJson(Map<String, dynamic> json) => _$GuideFromJson(json);
}

@freezed
class Categories with _$Categories {
  factory Categories({
    required Category culture,
    required Category beach,
    required Category gastronomy,
  }) = _Categories;

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);
}

@freezed
class Category with _$Category {
  factory Category({
    required List<Item> items,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
class Item with _$Item {
  factory Item({
    required String image,
    required String title,
    required String description,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class Review with _$Review {
  factory Review({
    @JsonKey(name: 'review_name') required String reviewName,
    @JsonKey(name: 'review_text') required String reviewText,
    required int rate,
    @JsonKey(name: 'review_date') required String reviewDate,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

