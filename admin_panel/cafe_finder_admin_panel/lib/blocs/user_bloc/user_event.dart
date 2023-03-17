part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  final List<Customer> customer;

  const LoadUser(
    this.customer,
  );
  @override
  List<Object> get props => [
        customer,
      ];
}
