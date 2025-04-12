import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FcmTest extends StatefulWidget {
  const FcmTest({super.key});

  @override
  State<FcmTest> createState() => _FcmTestState();
}

class _FcmTestState extends State<FcmTest> {
  late Future fcmToken = fetch();

  Future fetch() async {
    final notificationSettings = await FirebaseMessaging.instance
        .requestPermission(provisional: true);

    // For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
    final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    if (apnsToken != null) {
      // APNS token is available, make FCM plugin API requests...
    }

    final token = await FirebaseMessaging.instance.getToken(
      vapidKey:
          "BMd_dXaNjEg8OE0SsAbRVKb43YIZWVnvK__cSSyHgaJShUS8iZos97LorCMOd5oqy3XmknHghfGMet040wfdAWc",
    );

    print(token);

    return token;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fcmToken,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
