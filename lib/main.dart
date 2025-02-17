import 'package:deeplinks_app/data/service/firebase_service.dart';
import 'package:deeplinks_app/firebase_options.dart';
import 'package:deeplinks_app/presentation/router/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//adb shell am start -a android.intent.action.VIEW -d "https://novasystem.deeplinks_app.com/products/productId?productId=456" com.novasystem.deeplinks_app

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Shop Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
