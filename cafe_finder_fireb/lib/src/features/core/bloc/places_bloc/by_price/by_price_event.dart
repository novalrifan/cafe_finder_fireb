part of 'by_price_bloc.dart';

abstract class ByPriceEvent extends Equatable {
  const ByPriceEvent();
  @override
  List<Object> get props => [];
}

class LoadByPrice extends ByPriceEvent {
  final List<Coffeeshops> coffeeshops;

  const LoadByPrice(
    this.coffeeshops,
  );
  @override
  List<Object> get props => [
        coffeeshops,
      ];
}
