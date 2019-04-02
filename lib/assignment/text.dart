import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  final String newName;

  Texts(this.newName);

  @override
  Widget build(BuildContext context) {
    print('This is called');
    return Text(newName);
  }
}
