import 'package:flutter/material.dart';

import 'package:flutter_course/assignment/text_control.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Change Text"),
          ),
          body: TextControl("Meghna")),
    );
  }
}