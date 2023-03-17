part of 'by_distance_bloc.dart';

abstract class ByDistanceState extends Equatable {
  const ByDistanceState();

  @override
  List<Object?> get props => [];
}

class ByDistanceLoading extends ByDistanceState {}

class ByDistanceLoaded extends ByDistanceState {
  final List<Coffeeshops> coffeeshops;

  const ByDistanceLoaded(
    this.coffeeshops,
  );

  @override
  List<Object> get props => [coffeeshops, current];
}
