import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_up/controller/auth_provider.dart';
import 'package:stream_up/view/widgets/elevated_button_widget.dart';
import 'package:stream_up/view/widgets/logo_widget.dart';
import 'package:stream_up/view/widgets/title_widget.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoWidget(),
                TitleWidget(
                  title: 'STREAM UP',
                  subtitle: 'Create your own world',
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButtonWidget(
        text: 'Login With Google',
        onPressed: () async {
          ref.read(authenticationProvider.notifier).googleSignin(context);
        },
      ),
    );
  }
}
