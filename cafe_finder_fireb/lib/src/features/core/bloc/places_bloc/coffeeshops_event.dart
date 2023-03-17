part of 'coffeeshops_bloc.dart';

abstract class CoffeeshopsEvent extends Equatable {
  const CoffeeshopsEvent();
  @override
  List<Object> get props => [];
}

class LoadCoffeeshops extends CoffeeshopsEvent {
  final List<Coffeeshops> coffeeshops;

  const LoadCoffeeshops(
    this.coffeeshops,
  );
  @override
  List<Object> get props => [
        coffeeshops,
      ];
}

class UpdateLocation extends CoffeeshopsEvent {
  final List<Coffeeshops> coffeeshops;

  const UpdateLocation(
    this.coffeeshops,
  );
  @override
  List<Object> get props => [
        coffeeshops,
      ];
}
