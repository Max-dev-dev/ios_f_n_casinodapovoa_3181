// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entertainment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntertainmentImpl _$$EntertainmentImplFromJson(Map<String, dynamic> json) =>
    _$EntertainmentImpl(
      water: Category.fromJson(json['water'] as Map<String, dynamic>),
      restaurants:
          Category.fromJson(json['restaurants'] as Map<String, dynamic>),
      festival: Category.fromJson(json['festival'] as Map<String, dynamic>),
      others: Category.fromJson(json['others'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EntertainmentImplToJson(_$EntertainmentImpl instance) =>
    <String, dynamic>{
      'water': instance.water,
      'restaurants': instance.restaurants,
      'festival': instance.festival,
      'others': instance.others,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => EntrItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$EntrItemImpl _$$EntrItemImplFromJson(Map<String, dynamic> json) =>
    _$EntrItemImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$EntrItemImplToJson(_$EntrItemImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
    };
