import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_up/controller/auth_provider.dart';
import 'package:stream_up/view/pages/video_call_page.dart';
import 'package:stream_up/view/widgets/elevated_button_widget.dart';
import 'package:stream_up/view/widgets/logo_widget.dart';
import 'package:stream_up/view/widgets/title_widget.dart';

class StartPage extends ConsumerWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(authenticationProvider.notifier);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoWidget(),
                  TitleWidget(
                    title: 'STREAM UP',
                    subtitle: 'Lets Begin',
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 32,
            child: IconButton(
                onPressed: () {
                  data.signOut(context);
                },
                icon: Icon(Icons.logout)),
          )
        ],
      ),
      bottomNavigationBar: ElevatedButtonWidget(
        text: 'Create',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => VideoCallPage(
                      callID: '1',
                    )),
          );
        },
      ),
    );
  }
}
