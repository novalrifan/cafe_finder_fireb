// ignore_for_file: unused_import

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cafe_finder_admin_panel/repositories/customer/customer_repo.dart';
import 'package:cafe_finder_admin_panel/repositories/places/places_repo.dart';
import 'package:equatable/equatable.dart';

import '../../models/coffeeshop_model.dart';
import '../../models/customer_models.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // ignore: unused_field
  final CustomerRepo _customerRepo;

  StreamSubscription? _streamSubscription;

  UserBloc({
    required CustomerRepo customerRepo,
  })  : _customerRepo = customerRepo,
        super(UserLoading()) {
    on<LoadUser>(_onLoadUser);

    // on<UpdateLocation>(_onLoadDistances);

    _streamSubscription = _customerRepo.getUser().listen(
          (custom) => add(LoadUser(custom)),
        );
  }
  void _onLoadUser(
    LoadUser event,
    Emitter<UserState> emit,
  ) {
    emit(UserLoaded(event.customer));
  }

  // void _onLoadDistances(
  //   UpdateLocation event,
  //   Emitter<UserState> emit,
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
  //   List<Coffeeshops> coffeeshops = await _customerRepo.getCoffeeshops().first;

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
    _streamSubscription?.cancel();

    super.close();
  }
}
