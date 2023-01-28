// import 'dart:io';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
//
// class LogIn extends StatefulWidget {
//   const LogIn({Key? key}) : super(key: key);
//
//   @override
//   State<LogIn> createState() => _LogInState();
// }
//
// class _LogInState extends State<LogIn> {
//   final TextEditingController userName = TextEditingController();
//   final TextEditingController email = TextEditingController();
//   final TextEditingController passWord = TextEditingController();
//   String? Token;
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   @override
//   void initState() {
//     super.initState();
//     requestPermission();
//     getToken();
//     getInfo();
//   }
//
//   void requestPermission() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print("AuthorizationStatus.authorized");
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print("AuthorizationStatus.provisional");
//     } else {
//       print(" Decline or other issues no allowed");
//     }
//   }
//
//   void getToken() async {
//     await FirebaseMessaging.instance.getToken().then((token) {
//       setState(() {
//         token = token;
//         print("this is our token my device ${token.toString()}");
//       });
//       saveToken(token: token!);
//     });
//   }
//
//   void saveToken({required String token}) async {
//     await FirebaseFirestore.instance.collection("UserToken").doc("User1").set({
//       "token": token,
//     });
//   }
//
//   getInfo() {
//     var androidInitialize = const AndroidInitializationSettings(
//         "app/src/main/res/mipmap-mdpi/ic_launcher.png");
//     var iOSIniInitialize = const DarwinInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestSoundPermission: true);
//     var initializationSettings = InitializationSettings(
//         android: androidInitialize, iOS: iOSIniInitialize);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: (outPut) {
//       try {
//         if (outPut.payload != null && outPut.payload!.isNotEmpty) {
//           print("not equal to null");
//         } else {
//           print("this is else ");
//         }
//       } catch (error) {
//         print("this is error ");
//       }
//       return;
//     });
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       print("this is our message section");
//       BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
//         htmlFormatBigText: true,
//         message.notification!.body.toString() + " khalid",
//         contentTitle: message.notification!.title.toString() + " waled",
//         htmlFormatContentTitle: true,
//         htmlFormatSummaryText: true,
//         htmlFormatContent: true,
//         htmlFormatTitle: true,
//       );
//       AndroidNotificationDetails androidNotificationDetails =
//           AndroidNotificationDetails("My_Channel", "My_Channel",
//               importance: Importance.high,
//               styleInformation: bigTextStyleInformation,
//               priority: Priority.high,
//               playSound: true);
//       NotificationDetails notificationDetails = NotificationDetails(
//           android: androidNotificationDetails,
//           iOS: const DarwinNotificationDetails());
//       await flutterLocalNotificationsPlugin.show(0, message.notification!.title,
//           message.notification!.body, notificationDetails);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text("Welcome to login screen "),
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: "user Name",
//                 ),
//                 controller: userName,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: "user Name",
//                 ),
//                 controller: email,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: "user Name",
//                 ),
//                 controller: passWord,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   print("this is login");
//                 },
//                 child: Container(
//                   height: 50,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.blueAccent),
//                   child: Center(
//                     child: Text("Login"),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
