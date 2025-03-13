// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotels_model.freezed.dart';
part 'hotels_model.g.dart';

@freezed
class HotelList with _$HotelList {
  factory HotelList({
    required List<Hotel> hotels,
  }) = _HotelList;

  factory HotelList.fromJson(Map<String, dynamic> json) => _$HotelListFromJson(json);
}

@freezed
class Hotel with _$Hotel {
  factory Hotel({
    required String title,
    required String description,
    required String image,
    required double rate,
    required String street,
    @JsonKey(name: 'price_per_night') required int pricePerNight,
  }) = _Hotel;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}
