// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, unused_catch_clause, empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    await _firebaseAuth.fetchSignInMethodsForEmail(email);

    await updateWEmail(email: email);
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await saveEmail(email: email);
  }

  Future<void> sendResetPasswordEmail({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(
      email: email,
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _gAuthen = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _gAuthen.idToken, accessToken: _gAuthen.accessToken);
        await _firebaseAuth.signInWithCredential(_credential);
        DocumentSnapshot<Map<String, dynamic>> document =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(account.email)
                .get();
        if (document.exists) {
          await updateWGoogle(account);
        } else {
          await saveWGoogle(account);
        }
      }
      // if(account == null) {
      //   final _gAuthen = await account!.authentication;
      //   final _credential = GoogleAuthProvider.credential(
      //       idToken: _gAuthen.idToken, accessToken: _gAuthen.accessToken);
      //   await _firebaseAuth.signInWithCredential(_credential);
      //   await saveWGoogle(account);
      // }
    } on Exception catch (error) {}
  }

  Future<void> saveWGoogle(GoogleSignInAccount account) async {
    FirebaseFirestore.instance.collection('users').doc(account.email).set({
      "name": account.displayName,
      "email": account.email,
      "profilepic": account.photoUrl,
      "createdAt": DateTime.now(),
      "createdW": 'Google',
      "uid": currentUser!.uid,
    });
    print(".....saved data......");
  }

  Future<void> updateWGoogle(GoogleSignInAccount account) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.email)
        .update({
      "name": account.displayName,
      "profilepic": account.photoUrl,
      "loginAt": DateTime.now(),
      "loginWith": 'Google',
    });
    print(".....update data......");
  }

  Future<void> saveEmail({required String email}) async {
    FirebaseFirestore.instance.collection('users').doc(currentUser!.email).set({
      "uid": currentUser!.uid,
      "email": currentUser!.email,
      "name": currentUser!.displayName,
      "profilepic": currentUser!.photoURL,
      "createdAt": DateTime.now(),
      "createdW": 'Email',
    });
  }

  Future<void> updateWEmail({required String email}) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.email)
        .update({
      "loginAt": DateTime.now(),
      "loginWith": 'Email',
    });
  }

  Future<void> signOut() async {
    Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.disconnect(),
      _googleSignIn.signOut()
    ]);
  }

  Future<bool> get isSignedIn async {
    await authStateChanges.first;
    return currentUser != null;
  }
}
