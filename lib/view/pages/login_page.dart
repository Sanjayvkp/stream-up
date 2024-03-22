import 'package:flutter/material.dart';
import 'package:stream_up/controller/google_auth.dart';
import 'package:stream_up/view/widgets/elevated_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final channelController = TextEditingController();
  bool validateError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xff6393c9),
              Color(0xffd8eaff),
              Color(0xffd8eaff),
            ])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/images/video_logo.png')),
                ElevatedButtonWidget(
                  text: 'Login With Google',
                  onPressed: () async {
                    await LoginServices.signInWithGoogle();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
