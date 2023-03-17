part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<Customer> customer;

  const UserLoaded(
    this.customer,
  );

  @override
  List<Object> get props => [customer];
}
