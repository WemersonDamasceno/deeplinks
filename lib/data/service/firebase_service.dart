import 'dart:developer';

import 'package:deeplinks_app/presentation/router/router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {
  // create a instance of FirebaseService
  final _firebaseMenssaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMenssaging.requestPermission();

    final fCMToken = await _firebaseMenssaging.getToken();
    log(fCMToken.toString());

    initPushNotifications();
  }

  void onListenerNotification(RemoteMessage? message) async {
    if (message == null) return;

    if (message.data['deeplink'] != null) {
      final String deeplink = message.data['deeplink'];
      RouterImpl.redirectUser(deeplink);
    }
  }

  Future<void> initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(onListenerNotification);

    FirebaseMessaging.onMessageOpenedApp.listen(onListenerNotification);
  }
}
