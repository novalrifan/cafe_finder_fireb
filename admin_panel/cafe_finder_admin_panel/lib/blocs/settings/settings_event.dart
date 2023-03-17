part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LoadSettings extends SettingsEvent {
  final Coffeeshop coffeeshop;

  const LoadSettings({this.coffeeshop = const Coffeeshop()});

  @override
  List<Object> get props => [coffeeshop];
}

class UpdateSettings extends SettingsEvent {
  final bool isUpdateComplete;
  final Coffeeshop coffeeshop;

  const UpdateSettings(
      {this.isUpdateComplete = false, required this.coffeeshop});
  @override
  List<Object> get props => [isUpdateComplete, coffeeshop];
}

class UpdateOpeningHours extends SettingsEvent {
  final OpeningHours openingHours;

  const UpdateOpeningHours({required this.openingHours});
  @override
  List<Object> get props => [openingHours];
}
