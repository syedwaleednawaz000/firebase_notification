import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController passWord = TextEditingController();
  String? Token;
  @override
  void initState() {
    super.initState();
    requestPermission();
    getToken();
    print("this is our noti");

  }
  void requestPermission()async{
    FirebaseMessaging messaging= FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print("AuthorizationStatus.authorized");
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print("AuthorizationStatus.provisional");
    }else{
      print(" Decline or other issues no allowed");
    }
  }
  void getToken()async{
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        token = token;
        print("this is our token my device ${token.toString()}");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome to login screen "),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "user Name",
                ),
                controller: userName,
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "user Name",
                ),
                controller: userName,
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "user Name",
                ),
                controller: userName,
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  print("this is login");
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent
                  ),
                  child: Center(
                    child: Text("Login"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
