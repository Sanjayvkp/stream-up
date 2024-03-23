import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_up/controller/auth_provider.dart';
import 'package:stream_up/view/pages/video_call_page.dart';
import 'package:stream_up/view/widgets/elevated_button_widget.dart';
import 'package:stream_up/view/widgets/logo_widget.dart';
import 'package:stream_up/view/widgets/show_dialog_widget.dart';
import 'package:stream_up/view/widgets/title_widget.dart';
import 'package:uuid/uuid.dart';

class StartPage extends ConsumerWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uuid = Uuid().v1();
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogoWidget(),
                    TitleWidget(
                      title: 'STREAM UP',
                      subtitle: 'Lets Begin',
                    ),
                    SizedBox(
                      height: 32,
                    ),
                  ],
                ),
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
      bottomNavigationBar: Container(
        color: Color(0xffd8eaff),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButtonWidget(
                height: 58,
                text: 'Create',
                width: MediaQuery.sizeOf(context).width / 2.2,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => VideoCallPage(
                              callID: uuid,
                            )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButtonWidget(
                height: 58,
                text: 'Join',
                width: MediaQuery.sizeOf(context).width / 2.2,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ShowDialogWidget();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
