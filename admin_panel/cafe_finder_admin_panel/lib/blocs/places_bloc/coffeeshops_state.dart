part of 'coffeeshops_bloc.dart';

abstract class CoffeeshopsState extends Equatable {
  const CoffeeshopsState();

  @override
  List<Object?> get props => [];
}

class CoffeeshopLoading extends CoffeeshopsState {}

class CoffeeshopLoaded extends CoffeeshopsState {
  final List<Coffeeshop> coffeeshop;

  const CoffeeshopLoaded(
    this.coffeeshop,
  );

  @override
  List<Object> get props => [coffeeshop];
}
