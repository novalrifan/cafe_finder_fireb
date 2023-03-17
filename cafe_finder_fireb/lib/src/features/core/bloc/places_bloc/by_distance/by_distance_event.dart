part of 'by_distance_bloc.dart';

abstract class ByDistanceEvent extends Equatable {
  const ByDistanceEvent();
  @override
  List<Object> get props => [];
}

class LoadByDistance extends ByDistanceEvent {
  final List<Coffeeshops> coffeeshops;

  const LoadByDistance(
    this.coffeeshops,
  );
  @override
  List<Object> get props => [
        coffeeshops,
      ];
}
