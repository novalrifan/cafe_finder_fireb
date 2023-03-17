part of 'coffeeshops_bloc.dart';

abstract class CoffeeshopsState extends Equatable {
  const CoffeeshopsState();

  @override
  List<Object?> get props => [];
}

class CoffeeshopLoading extends CoffeeshopsState {}

class CoffeeshopLoaded extends CoffeeshopsState {
  final List<Coffeeshops> coffeeshops;

  const CoffeeshopLoaded(
    this.coffeeshops,
  );

  @override
  List<Object> get props => [coffeeshops, current];
}

class LocationLoaded extends CoffeeshopsState {
  final LatLng latLng;
  final List<Coffeeshops> coffeeshops;

  const LocationLoaded(this.coffeeshops, this.latLng);

  @override
  List<Object> get props => [coffeeshops, latLng];
}
