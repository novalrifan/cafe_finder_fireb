import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafe_finder_fireb/src/features/core/models/coffeestore_model.dart';
import 'package:equatable/equatable.dart';

import '../../repository/export_repo.dart';

part 'maut_method_event.dart';
part 'maut_method_state.dart';

// ignore_for_file: unused_import

class MautMethodBloc extends Bloc<MautMethodEvent, MautMethodState> {
  // ignore: unused_field
  final CoffeeRepo _coffeeRepo;

  StreamSubscription? _coffeeSubsription;

  MautMethodBloc({
    required CoffeeRepo coffeeRepo,
  })  : _coffeeRepo = coffeeRepo,
        super(MautMethodLoading()) {
    on<LoadMautMethod>(_onLoadMautMethod);

    // on<UpdateLocation>(_onLoadDistances);

    _coffeeSubsription = _coffeeRepo.getCoffeeshops().listen(
          (coffeeshops) => add(LoadMautMethod(coffeeshops)),
        );
  }
  void _onLoadMautMethod(
    LoadMautMethod event,
    Emitter<MautMethodState> emit,
  ) {
    emit(MautMethodLoaded(event.coffeeshops));
  }

  // void _onLoadDistances(
  //   UpdateLocation event,
  //   Emitter<MautMethodState> emit,
  // ) async {
  //   final LatLng currentLocation = getLatLngFromSharedPrefs();
  //   final state = this.state as LocationLoaded;

  //   // ignore: unused_local_variable
  //   List<MautMethod> MautMethod = await _getNearby(currentLocation);

  //   emit(
  //     LocationLoaded(
  //       state.MautMethod,
  //       currentLocation,
  //     ),
  //   );
  // }

  // Future<List<MautMethod>> _getNearby(LatLng currentLocation) async {
  //   List<MautMethod> MautMethod = await _coffeeRepo.getMautMethod().first;

  //   return MautMethod
  //       .where((coffeeshop) => _getDistance(coffeeshop, currentLocation) <= 10)
  //       .toList();
  // }

  // double _getDistance(
  //   MautMethod coffeeshop,
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
