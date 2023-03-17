// ignore_for_file: override_on_non_overriding_member, body_might_complete_normally_nullable, duplicate_ignore

import 'package:cafe_finder_fireb/src/features/core/repository/auth_/trash/base.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthRepo extends BaseAuthRepo {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepo({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  // ignore: body_might_complete_normally_nullable
  Future<auth.User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      return user;
    } catch (_) {}
  }

  @override
  Future<void> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (_) {}
  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<auth.User?> signup(
      {required String email, required String password}) async {}
}
