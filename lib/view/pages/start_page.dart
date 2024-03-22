import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_up/controller/auth_provider.dart';
import 'package:stream_up/view/pages/video_call_page.dart';
import 'package:stream_up/view/widgets/elevated_button_widget.dart';
import 'package:stream_up/view/widgets/text_field_widget.dart';

class StartPage extends ConsumerWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool validateError = false;
    final data = ref.read(authenticationProvider.notifier);
    final channelController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6393c9),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                ref.read(authenticationProvider.notifier).signOut(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
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
              SizedBox(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/images/video_logo.png')),
            ],
          ),
        ),
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
