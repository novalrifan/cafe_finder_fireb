part of 'byrate_bloc.dart';

abstract class ByRateEvent extends Equatable {
  const ByRateEvent();
  @override
  List<Object> get props => [];
}

class LoadByRate extends ByRateEvent {
  final List<Coffeeshops> coffeeshops;

  const LoadByRate(
    this.coffeeshops,
  );
  @override
  List<Object> get props => [
        coffeeshops,
      ];
}
