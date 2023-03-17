part of 'by_price_bloc.dart';

abstract class ByPriceState extends Equatable {
  const ByPriceState();

  @override
  List<Object?> get props => [];
}

class ByPriceLoading extends ByPriceState {}

class ByPriceLoaded extends ByPriceState {
  final List<Coffeeshops> coffeeshops;

  const ByPriceLoaded(
    this.coffeeshops,
  );

  @override
  List<Object> get props => [coffeeshops, current];
}
