import 'dart:convert';
import 'package:casino_da_povoa/models/booking_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'booking_cubit.freezed.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState({
    @Default([]) List<Booking> bookings,
    @Default(false) bool isLoading,
    @Default('') String error,
  }) = _BookingState;
}

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(const BookingState()) {
    _loadBookings();
  }

  Future<void> _loadBookings() async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> bookingJsonList = prefs.getStringList('bookings') ?? [];

      final bookings = bookingJsonList
          .map((json) => Booking.fromJson(jsonDecode(json)))
          .toList();

      emit(state.copyWith(bookings: bookings, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> addBooking(Booking booking) async {
    final updatedBookings = List<Booking>.from(state.bookings)..add(booking);
    emit(state.copyWith(bookings: updatedBookings));

    await _saveBookings(updatedBookings);
  }

  Future<void> removeBooking(Booking booking) async {
    final updatedBookings = List<Booking>.from(state.bookings)..remove(booking);
    emit(state.copyWith(bookings: updatedBookings));

    await _saveBookings(updatedBookings);
  }

  Future<void> _saveBookings(List<Booking> bookings) async {
    final prefs = await SharedPreferences.getInstance();
    final bookingJsonList = bookings.map((b) => jsonEncode(b.toJson())).toList();
    await prefs.setStringList('bookings', bookingJsonList);
  }
}
