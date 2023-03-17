part of 'mabac_method_bloc.dart';

abstract class MabacMethodState extends Equatable {
  const MabacMethodState();

  @override
  List<Object?> get props => [];
}

class MabacMethodLoading extends MabacMethodState {}

class MabacMethodLoaded extends MabacMethodState {
  final List<Coffeeshops> coffeeshops;

  const MabacMethodLoaded(
    this.coffeeshops,
  );

  @override
  List<Object> get props => [coffeeshops, current];
}
