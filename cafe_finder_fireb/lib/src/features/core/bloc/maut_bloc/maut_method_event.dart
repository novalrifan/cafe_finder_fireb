part of 'maut_method_bloc.dart';

abstract class MautMethodEvent extends Equatable {
  const MautMethodEvent();
  @override
  List<Object> get props => [];
}

class LoadMautMethod extends MautMethodEvent {
  final List<Coffeeshops> coffeeshops;

  const LoadMautMethod(
    this.coffeeshops,
  );
  @override
  List<Object> get props => [
        coffeeshops,
      ];
}
