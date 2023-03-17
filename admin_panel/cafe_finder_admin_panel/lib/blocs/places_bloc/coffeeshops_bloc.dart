// ignore_for_file: unused_import

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafe_finder_admin_panel/repositories/places/places_repo.dart';
import 'package:equatable/equatable.dart';

import '../../models/coffeeshop_model.dart';
import '../../models/opening_hours.dart';

part 'coffeeshops_event.dart';
part 'coffeeshops_state.dart';

class CoffeeshopsBloc extends Bloc<CoffeeshopsEvent, CoffeeshopsState> {
  // ignore: unused_field
  final PlaceRepo _coffeeRepo;

  StreamSubscription? _coffeeSubsription;

  CoffeeshopsBloc({
    required PlaceRepo coffeeRepo,
  })  : _coffeeRepo = coffeeRepo,
        super(CoffeeshopLoading()) {
    on<LoadCoffeeshops>(_onLoadCoffeeshops);

    // on<UpdateLocation>(_onLoadDistances);

    _coffeeSubsription = _coffeeRepo.getPlaces().listen(
          (coffeeshop) => add(LoadCoffeeshops(coffeeshop)),
        );
  }
  void _onLoadCoffeeshops(
    LoadCoffeeshops event,
    Emitter<CoffeeshopsState> emit,
  ) {
    emit(CoffeeshopLoaded(event.coffeeshop));
  }

  // void _onLoadDistances(
  //   UpdateLocation event,
  //   Emitter<CoffeeshopsState> emit,
  // ) async {
  //   final LatLng currentLocation = getLatLngFromSharedPrefs();
  //   final state = this.state as LocationLoaded;

  //   // ignore: unused_local_variable
  //   List<Coffeeshops> coffeeshops = await _getNearby(currentLocation);

  //   emit(
  //     LocationLoaded(
  //       state.coffeeshops,
  //       currentLocation,
  //     ),
  //   );
  // }

  // Future<List<Coffeeshops>> _getNearby(LatLng currentLocation) async {
  //   List<Coffeeshops> coffeeshops = await _coffeeRepo.getCoffeeshops().first;

  //   return coffeeshops
  //       .where((coffeeshop) => _getDistance(coffeeshop, currentLocation) <= 10)
  //       .toList();
  // }

  // double _getDistance(
  //   Coffeeshops coffeeshop,
  //   l,
  // ) {
  //   HaversineDistance haversineDistance = HaversineDistance();
  //   var distances = haversineDistance.haversine(
  //       Location(
  //           coffeeshop.latitude!.toDouble(), coffeeshop.longitude!.toDouble()),
  //       Location(current.latitude.toDouble(), current.longitude.toDouble()),
  //       Unit.KM);
  //   return distances;
  // }

  @override
  Future<void> close() async {
    _coffeeSubsription?.cancel();

    super.close();
  }
}
