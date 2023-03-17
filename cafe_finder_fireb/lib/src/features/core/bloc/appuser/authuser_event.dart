part of 'authuser_bloc.dart';

abstract class AuthuserEvent extends Equatable {
  const AuthuserEvent();
}

@immutable
class AuthUserEventLogout extends AuthuserEvent {
  const AuthUserEventLogout();

  @override
  List<Object?> get props => throw UnimplementedError();
}

@immutable
class AuthUserEventResetPassword extends AuthuserEvent {
  final String email;
  const AuthUserEventResetPassword({required this.email});

  @override
  List<Object?> get props => [email];
}

@immutable
class AuthUserEventLogin extends AuthuserEvent {
  final String email;
  final String password;
  const AuthUserEventLogin({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

@immutable
class AuthUserEventRegister extends AuthuserEvent {
  final String email;
  final String password;
  const AuthUserEventRegister({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

@immutable
class AuthUserEventWithGoogle extends AuthuserEvent {
  const AuthUserEventWithGoogle();

  @override
  List<Object?> get props => [];
}
