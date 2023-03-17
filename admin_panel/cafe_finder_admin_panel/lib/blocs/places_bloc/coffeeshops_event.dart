part of 'coffeeshops_bloc.dart';

abstract class CoffeeshopsEvent extends Equatable {
  const CoffeeshopsEvent();
  @override
  List<Object> get props => [];
}

class LoadCoffeeshops extends CoffeeshopsEvent {
  final List<Coffeeshop> coffeeshop;

  const LoadCoffeeshops(
    this.coffeeshop,
  );
  @override
  List<Object> get props => [
        coffeeshop,
      ];
}

class UpdateOpeningHours extends CoffeeshopsEvent {
  final OpeningHours openingHours;

  const UpdateOpeningHours({required this.openingHours});
  @override
  List<Object> get props => [openingHours];
}
