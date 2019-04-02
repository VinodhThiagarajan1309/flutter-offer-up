import 'package:flutter/material.dart';
import 'package:flutter_course/pages/products.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/");
          },
          child: Text("Login"),
        ),
      ),
    );
  }
}
