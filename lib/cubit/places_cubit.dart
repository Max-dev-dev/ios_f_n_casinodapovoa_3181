import 'dart:convert';
import 'package:casino_da_povoa/models/places_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'places_cubit.freezed.dart';

@freezed
class GuideState with _$GuideState {
  const factory GuideState({
    @Default([]) List<Guide> guides,
    @Default([]) List<Guide> favouriteGuides,
    @Default(false) bool isLoading,
    @Default('') String error,
  }) = _GuideState;
}

class GuideCubit extends Cubit<GuideState> {
  GuideCubit() : super(const GuideState());

  Future<void> loadGuides() async {
    Logger().i('Loading guides');
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final String response = await rootBundle.loadString('assets/places.json');
      final Map<String, dynamic> data = jsonDecode(response);
      final guides = GuideList.fromJson(data).guides;
      emit(state.copyWith(guides: guides, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  void addToFavourites(Guide guide) {
    Logger().i('Add guide to favourites: ${guide.name}');
    final updatedFavourites = List<Guide>.from(state.favouriteGuides)..add(guide);
    emit(state.copyWith(favouriteGuides: updatedFavourites));
  }

  void removeFromFavourites(Guide guide) {
    Logger().i('Remove guide from favourites: ${guide.name}');
    final updatedFavourites = List<Guide>.from(state.favouriteGuides)..remove(guide);
    emit(state.copyWith(favouriteGuides: updatedFavourites));
  }

  bool isFavourite(Guide guide) {
    return state.favouriteGuides.contains(guide);
  }
}
