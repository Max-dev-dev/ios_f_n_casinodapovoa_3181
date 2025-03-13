// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingImpl _$$BookingImplFromJson(Map<String, dynamic> json) =>
    _$BookingImpl(
      hotelTitle: json['hotelTitle'] as String,
      checkInDate: json['checkInDate'] as String,
      checkOutDate: json['checkOutDate'] as String,
      time: json['time'] as String,
      guests: (json['guests'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$BookingImplToJson(_$BookingImpl instance) =>
    <String, dynamic>{
      'hotelTitle': instance.hotelTitle,
      'checkInDate': instance.checkInDate,
      'checkOutDate': instance.checkOutDate,
      'time': instance.time,
      'guests': instance.guests,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
    };
