// ignore_for_file: avoid_print, unused_catch_clause, empty_catches, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cafe_finder_fireb/src/features/core/repository/auth_/authuser.dart';
import 'package:cafe_finder_fireb/src/features/core/repository/auth_/authuser_error.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'authuser_event.dart';
part 'authuser_state.dart';

class AuthuserBloc extends Bloc<AuthuserEvent, AuthuserState> {
  AuthuserBloc()
      : super(AuthUserStateLoggedOut(isLoading: false, successful: false)) {
    on<AuthUserEventLogin>((event, emit) async {
      emit(AuthUserStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(AuthUserStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogin = e.toString();
        emit(AuthUserStateLoggedOut(isLoading: false, successful: false));
      }
    });

    on<AuthUserEventLogout>((event, emit) async {
      emit(AuthUserStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().signOut();
        emit(AuthUserStateLoggedOut(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        print(authErrorOut);
        emit(AuthUserStateLoggedOut(isLoading: false, successful: true));
      }
    });

    on<AuthUserEventRegister>((event, emit) async {
      emit(AuthUserStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(AuthUserStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogin = e.toString();
        emit(AuthUserStateLoggedOut(isLoading: false, successful: true));
      }
    });
    on<AuthUserEventResetPassword>((event, emit) async {
      emit(AuthUserStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().sendResetPasswordEmail(email: event.email);
        emit(AuthUserStateLoggedIn(isLoading: false, successful: false));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogin = e.toString();
        emit(AuthUserStateLoggedOut(isLoading: false, successful: true));
      }
    });
    on<AuthUserEventWithGoogle>((event, emit) async {
      emit(AuthUserStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().signInWithGoogle();
        emit(AuthUserStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseException catch (e) {
        print(e);
        authErrorLogin = e.toString();
        emit(AuthUserStateLoggedOut(isLoading: false, successful: true));
      }
    });
  }
}
