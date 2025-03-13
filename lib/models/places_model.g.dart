// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuideListImpl _$$GuideListImplFromJson(Map<String, dynamic> json) =>
    _$GuideListImpl(
      guides: (json['guides'] as List<dynamic>)
          .map((e) => Guide.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GuideListImplToJson(_$GuideListImpl instance) =>
    <String, dynamic>{
      'guides': instance.guides,
    };

_$GuideImpl _$$GuideImplFromJson(Map<String, dynamic> json) => _$GuideImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      rate: (json['rate'] as num).toDouble(),
      image: json['image'] as String,
      categories:
          Categories.fromJson(json['categories'] as Map<String, dynamic>),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GuideImplToJson(_$GuideImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'rate': instance.rate,
      'image': instance.image,
      'categories': instance.categories,
      'reviews': instance.reviews,
    };

_$CategoriesImpl _$$CategoriesImplFromJson(Map<String, dynamic> json) =>
    _$CategoriesImpl(
      culture: Category.fromJson(json['culture'] as Map<String, dynamic>),
      beach: Category.fromJson(json['beach'] as Map<String, dynamic>),
      gastronomy: Category.fromJson(json['gastronomy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoriesImplToJson(_$CategoriesImpl instance) =>
    <String, dynamic>{
      'culture': instance.culture,
      'beach': instance.beach,
      'gastronomy': instance.gastronomy,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      image: json['image'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      reviewName: json['review_name'] as String,
      reviewText: json['review_text'] as String,
      rate: (json['rate'] as num).toInt(),
      reviewDate: json['review_date'] as String,
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'review_name': instance.reviewName,
      'review_text': instance.reviewText,
      'rate': instance.rate,
      'review_date': instance.reviewDate,
    };
