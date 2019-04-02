import 'package:flutter/material.dart';

import 'package:flutter_course/assignment/text.dart';

class TextControl extends StatefulWidget {

  final String startingProduct;

  TextControl(this.startingProduct) {
    print('Contructor Called');
  }


  @override
  State createState() {
    print('Create State');
    return _TextControlState();
  }


}

class _TextControlState extends State<TextControl> {
  String _products ;

  @override
  void initState() {
    print('Init Called');
    super.initState();
    _products= widget.startingProduct;
    // TODO: implement initState

  }


  @override
  void didUpdateWidget(TextControl oldWidget) {

    super.didUpdateWidget(oldWidget);

  }

  @override
  Widget build(BuildContext context) {
    print('Build Called');
    return Column(children: <Widget>[Container(
      margin: EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            _products = "Vinodh";
            print('Ding');
          });
        },
        child: Text(" Change Name "),
      ),
    ),
    Texts(_products)
    ],);
  }
}
