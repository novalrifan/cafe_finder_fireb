part of 'mabac_method_bloc.dart';

abstract class MabacMethodEvent extends Equatable {
  const MabacMethodEvent();
  @override
  List<Object> get props => [];
}

class LoadMabacMethod extends MabacMethodEvent {
  final List<Coffeeshops> coffeeshops;

  const LoadMabacMethod(
    this.coffeeshops,
  );
  @override
  List<Object> get props => [
        coffeeshops,
      ];
}
