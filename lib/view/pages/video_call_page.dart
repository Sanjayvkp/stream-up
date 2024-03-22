import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stream_up/utils/zego_utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCallPage extends StatelessWidget {
  const VideoCallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return ZegoUIKitPrebuiltCall(
      appID: ZegoUtils.appId,
      appSign: ZegoUtils.token,
      userID: 'user_id',
      userName: user.displayName!,
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
    );
  }
}
