import 'dart:convert';
import 'package:casino_da_povoa/models/entertainment_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'entertainment_cubit.freezed.dart';

@freezed
class EntertainmentState with _$EntertainmentState {
  const factory EntertainmentState({
    required Entertainment entertainment,
    @Default([]) List<EntrItem> favouriteItems,
    @Default(false) bool isLoading,
    @Default('') String error,
  }) = _EntertainmentState;
}

class EntertainmentCubit extends Cubit<EntertainmentState> {
  EntertainmentCubit()
      : super(EntertainmentState(entertainment: Entertainment(
          water: Category(items: []),
          restaurants: Category(items: []),
          festival: Category(items: []),
          others: Category(items: []),
        ))) {
    loadEntertainment();
    _loadFavourites();
  }

  Future<void> loadEntertainment() async {
    Logger().i('Loading entertainment data');
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final String response = await rootBundle.loadString('assets/entertainment.json');
      final Map<String, dynamic> data = jsonDecode(response);
      final entertainment = Entertainment.fromJson(data["entertainment"]);
      emit(state.copyWith(entertainment: entertainment, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> _loadFavourites() async {
    Logger().i('Loading favourite entertainment items');
    final prefs = await SharedPreferences.getInstance();
    final favouriteItemsJson = prefs.getStringList('favouriteEntertainment') ?? [];

    final favouriteItems = favouriteItemsJson
        .map((json) => EntrItem.fromJson(jsonDecode(json)))
        .toList();

    emit(state.copyWith(favouriteItems: favouriteItems));
  }

  Future<void> addToFavourites(EntrItem item) async {
    Logger().i('Adding entertainment to favourites: ${item.title}');
    final updatedFavourites = List<EntrItem>.from(state.favouriteItems)..add(item);
    emit(state.copyWith(favouriteItems: updatedFavourites));
    await _saveFavourites(updatedFavourites);
  }

  Future<void> removeFromFavourites(EntrItem item) async {
    Logger().i('Removing entertainment from favourites: ${item.title}');
    final updatedFavourites = List<EntrItem>.from(state.favouriteItems)..remove(item);
    emit(state.copyWith(favouriteItems: updatedFavourites));
    await _saveFavourites(updatedFavourites);
  }

  Future<void> _saveFavourites(List<EntrItem> favouriteItems) async {
    final prefs = await SharedPreferences.getInstance();
    final favouriteItemsJson = favouriteItems.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('favouriteEntertainment', favouriteItemsJson);
  }

  bool isFavourite(EntrItem item) {
    return state.favouriteItems.contains(item);
  }
}
