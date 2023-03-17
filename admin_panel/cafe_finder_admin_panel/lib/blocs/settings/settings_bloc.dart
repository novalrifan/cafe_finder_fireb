import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafe_finder_admin_panel/repositories/places/places_repo.dart';

import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final PlaceRepo _coffeeshopRepository;
  StreamSubscription? _coffeeshopSubscription;
  SettingsBloc({required PlaceRepo coffeeshopRepository})
      : _coffeeshopRepository = coffeeshopRepository,
        super(SettingsLoading()) {
    on<LoadSettings>(_onLoadSettings);
    on<UpdateSettings>(_onUpdateSettings);
    on<UpdateOpeningHours>(_onUpdateOpeningHours);

    _coffeeshopSubscription =
        coffeeshopRepository.getPlaces().listen((coffeeshop) {
      // ignore: avoid_print
      print(coffeeshop);

      add(LoadSettings(coffeeshop: coffeeshop.single));
    });
  }
  void _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(SettingsLoaded(event.coffeeshop));
  }

  void _onUpdateSettings(
    UpdateSettings event,
    Emitter<SettingsState> emit,
  ) {
    if (event.isUpdateComplete) {
      _coffeeshopRepository.editPlaceSettings(event.coffeeshop);
    }

    emit(SettingsLoaded(event.coffeeshop));
  }

  void _onUpdateOpeningHours(
    UpdateOpeningHours event,
    Emitter<SettingsState> emit,
  ) {
    final state = this.state;
    if (state is SettingsLoaded) {
      List<OpeningHours> openingHoursList =
          (state.coffeeshop.openingHours!.map((openingHours) {
        return openingHours.id == event.openingHours.id
            ? event.openingHours
            : openingHours;
      })).toList();
      _coffeeshopRepository.editPlaceOpeningHours(openingHoursList);
      emit(
        SettingsLoaded(
          state.coffeeshop.copyWith(openingHours: openingHoursList),
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    _coffeeshopSubscription?.cancel();
    super.close();
  }
}
