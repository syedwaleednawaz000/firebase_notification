// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
//
// import 'localnotificationservice.dart';
//
// Future<void> backgroundHandler(RemoteMessage message) async {
//   print(message.data.toString());
//   print(message.notification!.title);
// }
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   FirebaseMessaging.onBackgroundMessage(backgroundHandler);
//   LocalNotificationService.initialize();
//   runApp(MyApp());
// }
