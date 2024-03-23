import 'package:flutter/material.dart';
import 'package:stream_up/view/pages/video_call_page.dart';
import 'package:stream_up/view/widgets/elevated_button_widget.dart';
import 'package:stream_up/view/widgets/text_field_widget.dart';

class ShowDialogWidget extends StatefulWidget {
  const ShowDialogWidget({super.key});

  @override
  State<ShowDialogWidget> createState() => _ShowDialogWidgetState();
}

class _ShowDialogWidgetState extends State<ShowDialogWidget> {
  final TextEditingController uidController = TextEditingController();
  bool _validateError = false;
  @override
  void dispose() {
    uidController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Color(0xffd8eaff),
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldWidget(
              controller: uidController,
              errorText: _validateError ? "uid is mandatory" : null,
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButtonWidget(
              text: 'Join meet',
              onPressed: () {
                join();
              },
              width: 180,
              height: 40,
            ),
          ],
        ));
  }

  Future<void> join() async {
    setState(() {
      uidController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoCallPage(callID: uidController.text),
        ));
  }
}
