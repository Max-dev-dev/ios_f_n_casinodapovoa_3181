// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotels_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HotelListImpl _$$HotelListImplFromJson(Map<String, dynamic> json) =>
    _$HotelListImpl(
      hotels: (json['hotels'] as List<dynamic>)
          .map((e) => Hotel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HotelListImplToJson(_$HotelListImpl instance) =>
    <String, dynamic>{
      'hotels': instance.hotels,
    };

_$HotelImpl _$$HotelImplFromJson(Map<String, dynamic> json) => _$HotelImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      rate: (json['rate'] as num).toDouble(),
      street: json['street'] as String,
      pricePerNight: (json['price_per_night'] as num).toInt(),
    );

Map<String, dynamic> _$$HotelImplToJson(_$HotelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'rate': instance.rate,
      'street': instance.street,
      'price_per_night': instance.pricePerNight,
    };
