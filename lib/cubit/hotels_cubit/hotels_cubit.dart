import 'dart:convert';
import 'package:casino_da_povoa/models/hotels_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'hotels_cubit.freezed.dart';

@freezed
class HotelState with _$HotelState {
  const factory HotelState({
    @Default([]) List<Hotel> hotels,
    @Default([]) List<Hotel> favouriteHotels,
    @Default(false) bool isLoading,
    @Default('') String error,
  }) = _HotelState;
}

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(const HotelState()) {
    _loadFavourites();
  }

  Future<void> loadHotels() async {
    Logger().i('Loading hotels');
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final String response = await rootBundle.loadString('assets/hotels.json');
      final Map<String, dynamic> data = jsonDecode(response);
      final hotels = HotelList.fromJson(data).hotels;
      emit(state.copyWith(hotels: hotels, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> _loadFavourites() async {
    Logger().i('Loading favourite hotels');
    final prefs = await SharedPreferences.getInstance();
    final favouriteHotelsJson = prefs.getStringList('favouriteHotels') ?? [];
    
    final favouriteHotels = favouriteHotelsJson
        .map((json) => Hotel.fromJson(jsonDecode(json)))
        .toList();

    emit(state.copyWith(favouriteHotels: favouriteHotels));
  }

  Future<void> addToFavourites(Hotel hotel) async {
    Logger().i('Adding hotel to favourites: ${hotel.title}');
    final updatedFavourites = List<Hotel>.from(state.favouriteHotels)..add(hotel);
    emit(state.copyWith(favouriteHotels: updatedFavourites));
    await _saveFavourites(updatedFavourites);
  }

  Future<void> removeFromFavourites(Hotel hotel) async {
    Logger().i('Removing hotel from favourites: ${hotel.title}');
    final updatedFavourites = List<Hotel>.from(state.favouriteHotels)..remove(hotel);
    emit(state.copyWith(favouriteHotels: updatedFavourites));
    await _saveFavourites(updatedFavourites);
  }

  Future<void> _saveFavourites(List<Hotel> favouriteHotels) async {
    final prefs = await SharedPreferences.getInstance();
    final favouriteHotelsJson = favouriteHotels.map((hotel) => jsonEncode(hotel.toJson())).toList();
    await prefs.setStringList('favouriteHotels', favouriteHotelsJson);
  }

  bool isFavourite(Hotel hotel) {
    return state.favouriteHotels.contains(hotel);
  }
}
