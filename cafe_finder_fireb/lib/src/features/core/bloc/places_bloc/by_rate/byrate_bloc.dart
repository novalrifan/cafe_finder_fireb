// ignore_for_file: unused_import

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafe_finder_fireb/src/features/core/repository/store/coffeeshop_repo2.dart';

import 'package:cafe_finder_fireb/src/features/core/repository/store/coffeeshop_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:haversine_distance/haversine_distance.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../../../models/coffeestore_model.dart';

part 'byrate_event.dart';
part 'byrate_state.dart';

class ByRateBloc extends Bloc<ByRateEvent, ByRateState> {
  // ignore: unused_field
  final CoffeeRepo2 _coffeeRepo;

  StreamSubscription? _coffeeSubsription;

  ByRateBloc({
    required CoffeeRepo2 coffeeRepo,
  })  : _coffeeRepo = coffeeRepo,
        super(ByRateLoading()) {
    on<LoadByRate>(_onLoadByRate);

    // on<UpdateLocation>(_onLoadDistances);

    _coffeeSubsription = _coffeeRepo.getCoffeeshop2().listen(
          (coffeeshops) => add(LoadByRate(coffeeshops)),
        );
  }
  void _onLoadByRate(
    LoadByRate event,
    Emitter<ByRateState> emit,
  ) {
    emit(ByRateLoaded(event.coffeeshops));
  }

  // void _onLoadDistances(
  //   UpdateLocation event,
  //   Emitter<ByRateState> emit,
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
