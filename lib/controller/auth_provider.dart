import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stream_up/view/pages/login_page.dart';
import 'package:stream_up/view/pages/start_page.dart';

part 'auth_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  final channelController = TextEditingController();
  void build() {}
  Future<void> googleSignin(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    Future.sync(
      () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StartPage(),
          )),
    );
  }

  Future<void> signOut(BuildContext context) async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    print("User signed out successfully");
    Future.sync(() => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
        (route) => false));
  }
}
