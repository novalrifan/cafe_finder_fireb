import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafe_finder_fireb/src/features/core/models/coffeestore_model.dart';
import 'package:equatable/equatable.dart';

import '../../repository/export_repo.dart';

part 'mabac_method_event.dart';
part 'mabac_method_state.dart';

class MabacMethodBloc extends Bloc<MabacMethodEvent, MabacMethodState> {
  // ignore: unused_field
  final CoffeeRepo _coffeeRepo;

  StreamSubscription? _coffeeSubsription;

  MabacMethodBloc({
    required CoffeeRepo coffeeRepo,
  })  : _coffeeRepo = coffeeRepo,
        super(MabacMethodLoading()) {
    on<LoadMabacMethod>(_onLoadMabacMethod);

    // on<UpdateLocation>(_onLoadDistances);

    _coffeeSubsription = _coffeeRepo.getCoffeeshops().listen(
          (coffeeshops) => add(LoadMabacMethod(coffeeshops)),
        );
  }
  void _onLoadMabacMethod(
    LoadMabacMethod event,
    Emitter<MabacMethodState> emit,
  ) {
    emit(MabacMethodLoaded(event.coffeeshops));
  }

  // void _onLoadDistances(
  //   UpdateLocation event,
  //   Emitter<MabacMethodState> emit,
  // ) async {
  //   final LatLng currentLocation = getLatLngFromSharedPrefs();
  //   final state = this.state as LocationLoaded;

  //   // ignore: unused_local_variable
  //   List<MabacMethod> MabacMethod = await _getNearby(currentLocation);

  //   emit(
  //     LocationLoaded(
  //       state.MabacMethod,
  //       currentLocation,
  //     ),
  //   );
  // }

  // Future<List<MabacMethod>> _getNearby(LatLng currentLocation) async {
  //   List<MabacMethod> MabacMethod = await _coffeeRepo.getMabacMethod().first;

  //   return MabacMethod
  //       .where((coffeeshop) => _getDistance(coffeeshop, currentLocation) <= 10)
  //       .toList();
  // }

  // double _getDistance(
  //   MabacMethod coffeeshop,
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
