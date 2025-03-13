import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
class Booking with _$Booking {
  factory Booking({
    required String hotelTitle,
    required String checkInDate,
    required String checkOutDate,
    required String time,
    required int guests,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
}
