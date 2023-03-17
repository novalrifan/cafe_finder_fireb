part of 'maut_method_bloc.dart';

abstract class MautMethodState extends Equatable {
  const MautMethodState();

  @override
  List<Object?> get props => [];
}

class MautMethodLoading extends MautMethodState {}

class MautMethodLoaded extends MautMethodState {
  final List<Coffeeshops> coffeeshops;

  const MautMethodLoaded(
    this.coffeeshops,
  );

  @override
  List<Object> get props => [coffeeshops, current];
}
