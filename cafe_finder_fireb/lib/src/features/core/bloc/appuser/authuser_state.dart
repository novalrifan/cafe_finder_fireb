// ignore_for_file: prefer_const_constructors_in_immutables

part of 'authuser_bloc.dart';

abstract class AuthuserState extends Equatable {
  final bool isLoading;
  final bool successful;
  const AuthuserState({
    required this.isLoading,
    required this.successful,
  });
}

class AuthUserStateLoggedIn extends AuthuserState {
  AuthUserStateLoggedIn({
    required isLoading,
    required successful,
  }) : super(
          isLoading: isLoading,
          successful: successful,
        );

  @override
  List<Object?> get props => [isLoading, successful];
}

class AuthUserStateLoggedOut extends AuthuserState {
  AuthUserStateLoggedOut({
    required isLoading,
    required successful,
  }) : super(
          isLoading: isLoading,
          successful: successful,
        );

  @override
  List<Object?> get props => [isLoading, successful];
}
