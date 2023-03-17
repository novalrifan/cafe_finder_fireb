part of 'byrate_bloc.dart';

abstract class ByRateState extends Equatable {
  const ByRateState();

  @override
  List<Object?> get props => [];
}

class ByRateLoading extends ByRateState {}

class ByRateLoaded extends ByRateState {
  final List<Coffeeshops> coffeeshops;

  const ByRateLoaded(
    this.coffeeshops,
  );

  @override
  List<Object> get props => [coffeeshops, current];
}
