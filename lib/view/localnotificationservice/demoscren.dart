import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  String? title;
   DemoScreen({required this.title,Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
