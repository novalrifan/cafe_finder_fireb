part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final Coffeeshop coffeeshop;
  const SettingsLoaded(this.coffeeshop);

  @override
  List<Object> get props => [coffeeshop];
}
